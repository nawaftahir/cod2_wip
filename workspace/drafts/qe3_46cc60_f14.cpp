// 0x0046cc60 Map_Snapshot: 35%, sizes 691/694; needs 0x47ad20 (path in edi) and CString COMDAT identities; draft, not linked
// 0x0046cc60 (694 B): Map_Snapshot (strings "snapshots", "Snapshot save failed..")
void FUN_0046cc60()
{
	CString strMsg;
	CString strOrgPath, strOrgFile;
	FUN_0047ad20((const char *)&dword_010a4508, strOrgPath, strOrgFile);
	if (strOrgPath.GetLength() > 0)
	{
		if (strOrgPath.GetAt(strOrgPath.GetLength() - 1) != '\\')
			strOrgPath += '\\';
	}
	strOrgPath += "snapshots";
	bool bGo = true;
	struct _stat Stat;
	if (_stat(strOrgPath, &Stat) == -1)
		bGo = (_mkdir(strOrgPath) != -1);
	if (strOrgPath.GetLength() > 0)
	{
		if (strOrgPath.GetAt(strOrgPath.GetLength() - 1) != '\\')
			strOrgPath += '\\';
	}
	if (bGo)
	{
		int nCount = 0;
		long lSize = 0;
		CString strNewPath = strOrgPath;
		strNewPath += strOrgFile;
		CString strFile;
		while (bGo)
		{
			strFile.Format("%s.%i", (LPCTSTR)strNewPath, nCount);
			bGo = FUN_0046cbd0(strFile, lSize);
			nCount++;
		}
		FUN_00468910(strFile.GetBuffer(0), false);
		SetWindowText(dword_010bcd54, (const char *)&dword_010a4508);
		if (lSize > 12 * 1024 * 1024)
			Sys_Printf("The snapshot files in the [%s] directory total more than 4 megabytes. You might consider cleaning the directory up.", (LPCTSTR)strOrgPath);
	}
	else
	{
		strMsg.Format("Snapshot save failed.. unabled to create directory\n%s", (LPCTSTR)strOrgPath);
		((CWnd *)dword_01233488)->MessageBox(strMsg);
	}
}

