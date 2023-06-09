@echo off

set STYLE=anime_style
rem STYLE=opensketch_style
set RGB_PATH=input
set DEPTH_PATH=output
set RESULT_PATH=results\%STYLE%
set MAX_FRAMES=999
set RENDER_RES=480

rmdir /s /q %RESULT_PATH%
python informative-drawings\test.py --name %STYLE% --dataroot %RGB_PATH% --how_many %MAX_FRAMES% --size %RENDER_RES%

rmdir /s /q %DEPTH_PATH%
python midas\run.py --input_path %RGB_PATH% --output_path %DEPTH_PATH% --model_weights midas\model\model-f6b98070.pt 

set LINE_THRESHOLD=64
set USE_SWIG=1
set INPAINT=0
set DEPTH_CAMERA_NAME="apple_lidar"
set DEPTH_CAMERA_MODE="default"

python skeletonizer.py -- %RESULT_PATH% %RGB_PATH% %DEPTH_PATH% %LINE_THRESHOLD% %USE_SWIG% %INPAINT% %DEPTH_CAMERA_NAME% %DEPTH_CAMERA_MODE%

@pause