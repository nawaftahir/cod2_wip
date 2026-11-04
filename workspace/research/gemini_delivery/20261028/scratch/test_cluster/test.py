import sys
import shutil
from pathlib import Path

# Paths
root = Path("/home/nawaf/cod2/test/dev/radiant/.agents/gemini")
src_com_files = root / "src/universal/com_files.cpp"
backup_com_files = root / "scratch/test_cluster/com_files.cpp.bak"
attempt_path = root / "scratch/test_cluster/attempt.cpp"

# Backup original
if not backup_com_files.exists():
    shutil.copyfile(src_com_files, backup_com_files)

# Read attempt
code = attempt_path.read_text()

# Modify FS_IsPathSepChar to return int
code = code.replace("static bool FS_IsPathSepChar(char c)", "static int FS_IsPathSepChar(char c)")

# Write to src/universal/com_files.cpp
src_com_files.write_text(code)
print("Updated com_files.cpp from attempt.cpp with int FS_IsPathSepChar")
