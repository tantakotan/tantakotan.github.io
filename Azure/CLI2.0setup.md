#Windows
#Get Azure CLI 2.0 on Windows using pip.

If you don't already have Python 2.7, 3.4 or 3.5 installed, we recommend you install version 3.5.x.

Visit the Python site and download Python 3.5 for Windows. Be sure to install the Pip component when you install Python. After the install completes, add Python 3.5 to your PATH environment variable (the installer will prompt you).

Check your Python installation from a command prompt.

'''
bash
  python --version
  Install Azure CLI 2.0 using pip.

bash
  pip install --user azure-cli
'''

Add %APPDATA%\PythonXY\Scripts to your PATH. Where X.Y is your Python version (for example, %APPDATA%\Python27\Scripts).5
Run Azure CLI 2.0 from the command prompt with the 'az' command.
