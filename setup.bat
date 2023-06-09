@echo off

cd /D %~dp0

pip install -r requirements-win.txt
rem pip install --pre torch torchvision -f https://download.pytorch.org/whl/nightly/cu113/torch_nightly.html
pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116

rem cd informative-drawings

powershell -Command "Invoke-WebRequest https://fox-gieg.com/patches/github/n1ckfg/latk-ml-004/models/checkpoints.zip -OutFile checkpoints.zip"
powershell Expand-Archive checkpoints.zip -DestinationPath .
del checkpoints.zip

@pause