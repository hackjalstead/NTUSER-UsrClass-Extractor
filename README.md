# NTUSER-UsrClass-Extractor
Quick PowerShell script to pull NTUSER &amp; UsrClass when pointed at a root level directory. 

Pulls NTUser & UsrClass for every user and puts them in the root of a folder named as their username.

It will work on live hosts (although won't pull NTUSER for user you're logged in as), mounted images & the mounted drive letter folder within the KAPE targets folder.

Mainly for quick access to the artefacts. 
