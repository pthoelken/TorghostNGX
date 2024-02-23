## What is TorGhost ?
TorGhost is an anonymization script. TorGhost redirects all internet traffic through SOCKS5 tor proxy. DNS requests are also redirected via tor, thus preventing DNSLeak. The scripts also disables unsafe packets exiting the system. Some packets like ping request can compromise your identity.

## Development Progress
Project is currecntly in development




Requirement already satisfied: cython in /usr/local/lib/python3.11/dist-packages (from -r requirements.txt (line 3)) (3.0.8)
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
Compiling /root/TorghostNGX/torghost.py
/usr/local/lib/python3.11/dist-packages/Cython/Compiler/Main.py:381: FutureWarning: Cython directive 'language_level' not set, using '3str' for now (Py3). This has changed from earlier releases! File: /root/TorghostNGX/torghost.py
  tree = Parsing.p_module(s, pxd, full_module_name)
