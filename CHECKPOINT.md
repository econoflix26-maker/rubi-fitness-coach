# RUBÍ Fitness Coach — CHECKPOINT
**Fecha:** 2026-11-18  
**Sesión:** Auditoría y publicación de v0.7 en Vercel  
**Estado:** v0.7 desplegada en producción; arquitectura auditada.

## 1. Referencias de proyecto
- Repositorio GitHub: https://github.com/econoflix26-maker/rubi-fitness-coach
- Rama revisada: `main`
- Proyecto Vercel: `rubi-fitness-coach`
- Dominio de producción: https://rubi-fitness-coach-rubenrubi93.vercel.app
- Deployment de producción v0.7: `dpl_93MjPLsHKWmiwrzHrod62ZvNt2rJ`
- Estado comprobado: `READY`, alias de producción asignados, sin aliasError.
- Artefacto desplegado: `rubi_fitness_coach_visual_v07.html` (95.620 bytes), publicado como `src/index.html` en el deployment.
- La v0.7 se ha desplegado directamente a Vercel. No se ha sincronizado todavía el HTML v0.7 en GitHub `main/index.html`; el repositorio y el deployment pueden seguir divergentes.

## 2. Arquitectura comprobada
- Aplicación estática HTML/CSS/JavaScript, sin framework.
- El proyecto Vercel informa `framework: null`.
- La autenticación del HTML v0.7 usa `localStorage` (`rubiUsers`, `rubiSession`); no es Supabase Auth.
- No se ha encontrado configuración ni esquema Supabase en las rutas comprobadas.
- El proyecto de Vercel tiene configurada su raíz de aplicación como `src`; el archivo se desplegó como `index.html` relativo a esa raíz y el árbol final confirma `src/index.html`.

## 3. Funcionalidad presente en el artefacto v0.7
- Interfaz responsive con navegación: Inicio, Entrenamiento, Running, Biblioteca, Progreso y Perfil.
- Pantalla de acceso/registro local.
- Biblioteca de ejercicios con dataset externo Exercises Dataset (MIT), filtros, búsqueda, detalle e instrucciones.
- Integración preparada con API pública de wger, con atribución/licencias por entrada y restricciones para mostrar medios.
- Datos y pantallas de demostración identificados como ejemplo en varias áreas.

## 4. Pendiente / no implementado como funcionalidad real
- Migrar autenticación local a Supabase Auth.
- Persistencia real de perfiles, entrenamientos, running y métricas.
- Registro interactivo de sesiones y planes editables.
- Gráficas históricas con datos del usuario.
- Validar en navegador la carga del dataset y la conexión a wger.
- RUBÍ AI Coach y funcionalidades Premium.
- Validar seguridad, reglas de acceso y modelo de datos antes de conectar cuentas reales.
- Sincronizar el HTML v0.7 en GitHub `main` para evitar divergencia entre repositorio y producción.

## 5. Documentación maestra
- No se ha localizado el PROJECT MASTER original ni un CHECKPOINT previo en la Library ni en las rutas habituales del repositorio. No se ha supuesto su contenido.
- Solicitar al usuario que adjunte esos documentos antes de reordenar el roadmap funcional.

## 6. Cambios de esta sesión
- Publicado el artefacto v0.7 directamente en Vercel producción.
- Verificado deployment `READY`, alias de producción y árbol `src/index.html`.
- No se han modificado tablas, credenciales, variables de entorno ni configuración de Supabase.
- No se ha actualizado aún el HTML de GitHub `main/index.html`.
- Próximo paso: validar visual y funcionalmente la URL de producción, comparar el comportamiento con el HTML v0.7 y, después, sincronizar la fuente de GitHub de forma controlada.
