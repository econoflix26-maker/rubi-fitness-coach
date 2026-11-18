# wger integration for RUBÍ Fitness Coach

## Integration decision

wger is a complete Django fitness/workout management application, not a drop-in exercise-library package. RUBÍ will keep its own UI and app architecture and use the public wger REST API as a supplemental exercise source. We will not copy or embed the wger Django application.

- Project: https://github.com/wger-project/wger
- Live service/API: https://wger.de/api/v2/
- API docs: https://wger.readthedocs.io/en/latest/api/index.html
- Public exercise information endpoint: `/api/v2/exerciseinfo/`
- Spanish translation filter supported by the exercise API: `language__code=es`
- Public listing endpoints can be read without authentication; user-owned objects require authentication.

## Licensing — keep these separate

1. **wger application code:** AGPL-3.0-or-later. This governs the wger application source code. RUBÍ does not copy or modify that application code as part of this integration.
2. **Exercise and ingredient data:** Creative Commons, with the applicable licence attached to individual entries. wger's documentation describes the initial exercise/ingredient data as CC BY-SA 3.0; current entries expose their own licence metadata. Preserve per-entry attribution and licence information when importing/adapting records.
3. **Images and videos:** each media item has its own licence and author metadata. Do not assume that the application's AGPL or the exercise-data licence automatically licenses media. Only display or reuse a wger image/video when the API's own media record provides usable licence and attribution details, and retain those details in the UI.

Useful source references:
- https://github.com/wger-project/wger/blob/master/README.md
- https://github.com/wger-project/wger/blob/master/LICENSE.txt
- https://wger.readthedocs.io/en/latest/index.html
- https://wger.readthedocs.io/en/latest/api/index.html

## Combined RUBÍ exercise library

RUBÍ uses two complementary sources:

- **Exercises Dataset** by Hasan Emir Yıldırım: 1,324 exercises; metadata and instruction translations are MIT. Gym visual thumbnails/GIFs are excluded until RUBÍ has its own permission/licence.
- **wger API:** supplemental exercise information, localized translations, body parts, muscles, equipment, and per-record media/license metadata.

When combining records, deduplicate cautiously using normalized Spanish/English exercise names plus muscle/equipment context; preserve both source IDs and source/licence metadata. Do not overwrite one source's attribution with the other's. For media, follow the licence of the exact image/video record, not merely the exercise record.

The UI should label source and attribution on every exercise detail view. If wger is unavailable, the Exercises Dataset remains the fallback catalogue.
