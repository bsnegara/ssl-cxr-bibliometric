# Thesauri (VOSviewer format, tab-separated, columns `label` and `replace by`)

## Files to add before upload

| File | Use | Size in final run |
|---|---|---|
| `thesaurus_vos.txt` | Author-keyword synonyms; an empty `replace by` removes the term (search concepts, generic terms) | 41 rows |
| `thesaurus_cocitation.txt` | Maps cited-reference variants of the same work to one standard label, e.g. `berthelot 2019, mixmatch` | 81 variants to 58 labels |

The same synonym and removal lists are used in bibliometrix (`synonyms`, `remove.terms`) for the thematic map, thematic evolution, and burst detection.
