# RUBÍ Fitness Coach v1.0 backend foundation

This folder is the backend groundwork for v1.0. It does not replace the production v0.7 artifact.

## Scope
- Supabase Auth: email/password sign-up, sign-in, sign-out, password recovery, session persistence.
- User-owned data: profiles, workout templates, workout sessions, running activities, weekly planner entries and progress metrics.
- Row Level Security (RLS) on every public table. Every owner policy uses `auth.uid()`; no client-side service-role key.

## Bootstrap SQL
`schema-bootstrap.sql` is the reviewed initial schema/policy bundle. Apply it only to a dedicated RUBÍ Supabase project after the project has been created and confirmed healthy. It is designed for a clean project and can be reapplied for policies/triggers; table creation is guarded.

## Auth implementation acceptance checklist
1. Use the Supabase JS client pinned to a known version (or import map with pinned URL).
2. Keep only the publishable/anon client key in browser code. Never put the service-role key in HTML or public environment variables.
3. Registration: validate name/email/password locally, call Auth sign-up, then create/upsert the user's profile. Treat email confirmation according to project Auth settings.
4. Login: call Auth sign-in with password; derive user identity from the returned authenticated user/session, not local storage.
5. Password recovery: send recovery email to a configured production redirect; implement a recovery screen that accepts the recovery session and updates password.
6. Logout: call Auth sign-out; clear any local UI state.
7. Session: restore via Auth session APIs on page load; handle auth-state changes.
8. Data operations: always scope requests by authenticated user; RLS is the authoritative guard. Don't rely on client-side filters for security.
9. Test two separate accounts and verify that neither can read, update, or delete the other's rows.
10. Before production deploy: verify mobile layouts, registration, login, recovery, password change, logout, persistence, and data isolation.

## Production preservation
The latest v0.7 production source is not identical to the current GitHub main branch. Keep v0.7 live while integrating on this branch and only switch the Vercel production alias after the v1.0 build has been tested.
