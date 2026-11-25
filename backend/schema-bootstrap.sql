-- RUBÍ Fitness Coach v1.0 backend foundation
-- Apply only to a dedicated RUBÍ Supabase project after review.
-- All user-owned records are scoped to auth.uid() by RLS.

create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.workout_templates (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  modality text not null default 'gym',
  goal text,
  exercises jsonb not null default '[]'::jsonb check (jsonb_typeof(exercises) = 'array'),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.workout_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  template_id uuid references public.workout_templates(id) on delete set null,
  name text not null,
  modality text not null default 'gym',
  started_at timestamptz,
  finished_at timestamptz,
  duration_seconds integer check (duration_seconds is null or duration_seconds >= 0),
  session_data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists public.running_activities (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  activity_date timestamptz not null default now(),
  distance_km numeric(7,3) not null check (distance_km >= 0),
  duration_seconds integer not null check (duration_seconds >= 0),
  avg_pace_seconds_per_km integer,
  avg_heart_rate integer,
  notes text,
  activity_data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists public.planner_entries (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  planned_date date not null,
  modality text not null,
  title text not null,
  template_id uuid references public.workout_templates(id) on delete set null,
  notes text,
  completed_session_id uuid references public.workout_sessions(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.progress_metrics (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  measured_at timestamptz not null default now(),
  metric_type text not null,
  metric_value numeric not null,
  unit text,
  notes text,
  created_at timestamptz not null default now()
);

-- updated_at helper
create or replace function public.set_updated_at()
returns trigger language plpgsql set search_path = '' as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists profiles_set_updated_at on public.profiles;
create trigger profiles_set_updated_at before update on public.profiles
for each row execute function public.set_updated_at();

drop trigger if exists workout_templates_set_updated_at on public.workout_templates;
create trigger workout_templates_set_updated_at before update on public.workout_templates
for each row execute function public.set_updated_at();

drop trigger if exists planner_entries_set_updated_at on public.planner_entries;
create trigger planner_entries_set_updated_at before update on public.planner_entries
for each row execute function public.set_updated_at();

alter table public.profiles enable row level security;
alter table public.workout_templates enable row level security;
alter table public.workout_sessions enable row level security;
alter table public.running_activities enable row level security;
alter table public.planner_entries enable row level security;
alter table public.progress_metrics enable row level security;

-- Policies are owner-only. UPDATE policies include USING and WITH CHECK to prevent owner reassignment.
drop policy if exists profiles_select_own on public.profiles;
create policy profiles_select_own on public.profiles for select to authenticated using (id = (select auth.uid()));
drop policy if exists profiles_insert_own on public.profiles;
create policy profiles_insert_own on public.profiles for insert to authenticated with check (id = (select auth.uid()));
drop policy if exists profiles_update_own on public.profiles;
create policy profiles_update_own on public.profiles for update to authenticated using (id = (select auth.uid())) with check (id = (select auth.uid()));

drop policy if exists workout_templates_owner_all on public.workout_templates;
create policy workout_templates_owner_all on public.workout_templates for all to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

drop policy if exists workout_sessions_owner_all on public.workout_sessions;
create policy workout_sessions_owner_all on public.workout_sessions for all to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

drop policy if exists running_activities_owner_all on public.running_activities;
create policy running_activities_owner_all on public.running_activities for all to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

drop policy if exists planner_entries_owner_all on public.planner_entries;
create policy planner_entries_owner_all on public.planner_entries for all to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

drop policy if exists progress_metrics_owner_all on public.progress_metrics;
create policy progress_metrics_owner_all on public.progress_metrics for all to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

grant select, insert, update, delete on public.workout_templates, public.workout_sessions, public.running_activities, public.planner_entries, public.progress_metrics to authenticated;
grant select, insert, update on public.profiles to authenticated;
