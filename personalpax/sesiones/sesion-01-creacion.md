# personalpax — Documento de sesión 1

> **Sesión:** 1 — Creación del subproyecto
> **Fecha:** 5-jul-2026
> **Estado al cerrar:** Fase 0 completa, Fase 1 pendiente

---

## Qué se hizo

1. **Erik pidió crear el subproyecto `personalpax`** para el área 💚 Personal de
   open-pax (la única de las 4 áreas que no tenía subproyecto).

2. **Clarificadas 2 decisiones con Erik:**
   - Cobertura: **gestión personal completa** (finanzas + salud mental + agenda
     + hábitos), no solo finanzas ni solo salud mental.
   - Ubicación 24/7: **definir después** (cuando sepamos qué componentes exactos
     necesita).

3. **Creado el subproyecto `personalpax`** con estructura completa:
   ```
   open-pax/personalpax/
   ├── EXPEDIENTE-MAESTRO.md        ← fuente de verdad
   ├── .gitignore                   ← bitácora personal NUNCA a git
   ├── bitacora/                    ← datos sensibles (cifrados)
   ├── documentos/
   ├── diagramas/
   ├── codigo/
   └── sesiones/
       └── sesion-01-creacion.md    ← este archivo
   ```

4. **Definidas las 4 áreas con prioridades** (PR4):
   - 🧘 Salud mental (1ª) — base TDAH/ACC
   - 💵 Finanzas (2ª) — quita el estrés del dinero
   - 📅 Agenda (3ª) — organiza el tiempo
   - 🔁 Hábitos (4ª) — optimiza los ritmos

5. **Establecidas 6 Reglas de Oro** (PR1-PR6):
   - PR1: Diseñado para TDAH (sin culpa, sin repetición)
   - PR2: Todo por Telegram (canal existente)
   - PR3: Privacidad absoluta (datos sensibles cifrados, nunca en git)
   - PR4: Una área a la vez (salud mental primero)
   - PR5: Datos honestos (no se inventan)
   - PR6: Supervisión humana en lo delicado (heredada)

6. **Resuelto el caso límite con recursospax:** las suscripciones personales de
   entretenimiento (Netflix, Spotify) son **gasto personal** → van a
   personalpax. recursospax es solo para lo técnico.

---

## Pendientes para la próxima sesión

- [ ] **Fase 1.1:** Definir dónde viven los datos sensibles (cifrados, fuera de
      git). Opciones a evaluar: carpeta local cifrada (age/gpg), BD en Oracle,
      Supabase con RLS.
- [ ] **Fase 1.2-1.5:** Crear las 4 bitácoras (medicación, gastos, ánimo, citas)
- [ ] **Fase 1.6:** Configurar el primer cron de recordatorio de medicación en
      Letta
- [ ] **Fase 1.7:** Probar el flujo completo: cron → Letta → Telegram → Erik
- [ ] Definir la ubicación 24/7 (cuando sepamos qué necesita el cron)

---

## Decisiones tomadas

1. **Salud mental primero.** Aunque "finanzas" suena más concreto, la medicación
   TDAH/ACC es la base. Si el ánimo y la medicación fallan, el resto no rinde.

2. **Usar el bot existente.** No se crea un nuevo bot. personalpax añade flujos
   al agente `open-pax` que ya responde en `@LaInconclusa80_bot`.

3. **Datos sensibles fuera de git.** La bitácora personal (gastos, medicación,
   ánimo) se guarda cifrada. El `.gitignore` bloquea toda la carpeta `bitacora/`.

4. **personalpax NO es terapia.** Es un asistente que recuerda y acompaña. Se
   documenta el encuadre honesto en el expediente.

---

## Próximo paso recomendado (R7: UN solo siguiente paso)

**Definir dónde viven los datos sensibles y crear la bitácora de medicación.**
El siguiente mensaje de arranque para la próxima sesión sería:

> "Continúa con personalpax Fase 1: define dónde guardar los datos sensibles
> (cifrados, fuera de git), crea `bitacora/01_medicacion.md` con los horarios
> de medicación de Erik (TDAH/ACC), y configura el primer cron de recordatorio
> en Letta para que @LaInconclusa80_bot le recuerde la medicación por Telegram."