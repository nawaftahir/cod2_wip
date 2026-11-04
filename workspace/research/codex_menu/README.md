# Menu/color and shared CRT corrections

Six game bodies in AdvCurveDlg.cpp reproduce 772 retail bytes. Three preset
pointer tables are recovered in original order, before selection/subclass/controls.
The live model test compares their pointed-to strings and every operand binding.

Library corrections are pinned to original imports, actual archive members and
stock referee matches. test_libraries.py additionally checks COFF bytes and
relocation targets against the original ChooseColorA, DestroyMenu and DeleteFileA
imports. _remove is the 42-byte deletion body; __unlink is a five-byte jump to it.
No byte masks or verifier predicates were changed.

Run inside the pinned image, from this tree:

    python3 workspace/research/codex_menu/test_libraries.py
    python3 workspace/research/codex_lifetime/test_lifetime.py
    python3 workspace/research/codex_lifetime/test_accounting.py

The last test rejects a wrong compiler helper and preserves the positive report.
Source attempts and full logs remain in scratch/codex_1028_advcurve_menu.
