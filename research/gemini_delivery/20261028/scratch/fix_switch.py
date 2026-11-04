from pathlib import Path
import re

path = Path("/home/nawaf/cod2/test/dev/radiant/.agents/gemini/src/universal/com_files.cpp")
text = path.read_text()

# Find FS_IsPathSepChar
start = text.index("static int FS_IsPathSepChar(char c)")
end = text.index("static bool FS_SanitizeFilename", start)

replacement = """static int FS_IsPathSepChar(char c)
{
	switch ( c )
	{
	case '/':
	case '\\\\':
		return 1;
	default:
		return 0;
	}
}
"""

text = text[:start] + replacement + text[end:]
path.write_text(text)
print("Updated cleanly with switch")
