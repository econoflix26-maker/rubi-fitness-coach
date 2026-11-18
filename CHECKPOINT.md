# RUBÍ Fitness Coach — CHECKPOINT
**Fecha:** 2026-11-18  
**Sesión:** Reanudación y auditoría previa a cambios  
**Estado:** Auditoría realizada; sin cambios en código ni despliegue.

## 1. Referencias de proyecto
- Repositorio GitHub: https://github.com/econoflix26-maker/rubi-fitness-coach
- Rama revisada: `main`
- Proyecto Vercel: `rubi-fitness-coach`
- Dominio conocido: https://rubi-fitness-coach-rubenrubi93.vercel.app
- Último artefacto visual localizado en Library: `rubi_fitness_coach_visual_v07.html` (95.620 bytes).
- El documento denominado PROJECT MASTER y un CHECKPOINT previo no se han localizado en la Library ni en las rutas habituales del repositorio (`PROJECT_MASTER.md`, `PROJECT-MASTER.md`, `CHECKPOINT.md`, `docs/PROJECT_MASTER.md`, `docs/CHECKPOINT.md`). No se ha supuesto su contenido.

## 2. Arquitectura comprobada
- La versión de GitHub `main/index.html` es una aplicación estática HTML/CSS/JavaScript, sin framework.
- La última versión de producción de Vercel figura como READY y el árbol de archivos del deployment contiene un único archivo: `src/index.html`.
- El proyecto Vercel informa `framework: null`.
- La autenticación implementada en el HTML de GitHub es local mediante `localStorage` (`rubiUsers`, `rubiSession`); no es Supabase Auth.
- No se ha encontrado configuración ni esquema Supabase en las rutas comprobadas.

## 3. Funcionalidad localizada
### Presente en el artefacto visual v0.7 (Library)
- Interfaz responsive con navegación: Inicio, Entrenamiento, Running, Biblioteca, Progreso y Perfil.
- Pantalla de acceso/registro local.
- Biblioteca de ejercicios con dataset externo Exercises Dataset (MIT), filtros, búsqueda, detalle e instrucciones.
- Integración preparada con API pública de wger, con atribución/licencias por entrada y restricciones para mostrar medios.
- Datos y pantallas de demostración claramente identificados como ejemplo en varias áreas.

### Pendiente / no implementado como funcionalidad real
- Migrar autenticación local a Supabase Auth.
- Persistencia real de perfiles, entrenamientos, running y métricas.
- Registro interactivo de sesiones y planes editables.
- Gráficas históricas con datos del usuario.
- Validar en navegador la carga del dataset y la conexión a wger.
- RUBÍ AI Coach y funcionalidades Premium.
- Validar seguridad, reglas de acceso y modelo de datos antes de conectar cuentas reales.

## 4. Diferencia crítica entre artefactos
- El HTML v0.7 está localizado en la Library, pero no se ha confirmado en `main`.
- El archivo `main/index.html` recuperado desde GitHub es una versión anterior: su biblioteca es de muestra y los botones de entrenamiento/registro muestran mensajes de “pendiente”.
- Por tanto, no debe asumirse que v0.7 esté publicado en producción.
- Vercel reporta el deployment actual como READY, pero READY solo confirma el estado del deployment, no que corresponda al HTML v0.7 ni que todas las funciones estén operativas.

## 5. Próxima tarea
1. Recuperar/adjuntar el PROJECT MASTER original y el último CHECKPOINT anterior para respetar decisiones y orden de trabajo.
2. Comparar el artefacto v0.7 con el deployment actual y probar la experiencia real en navegador.
3. Cerrar el diseño visual antes de iniciar integraciones reales.
4. Solo después, ejecutar la siguiente tarea funcional que establezca el PROJECT MASTER, sin duplicar módulos existentes.

## 6. Cambios de esta sesión
- Ningún cambio en código, base de datos, configuración de Supabase o despliegue.
- Este archivo CHECKPOINT se crea para dejar constancia de la auditoría y del punto exacto de reanudación.
