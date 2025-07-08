@echo off
REM Python Game Development Setup Script
REM Sets up Python environment for 2D and 3D game development

echo ========================================
echo Python Game Development Setup
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed or not in PATH
    echo Please install Python from https://python.org
    echo Make sure to check "Add Python to PATH" during installation
    pause
    exit /b 1
)

echo [OK] Python is installed
python --version
echo.

REM Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip
echo.

REM Create virtual environment (optional but recommended)
echo Creating virtual environment 'gamedev-env'...
python -m venv gamedev-env
echo.
echo Virtual environment created. To activate:
echo   - Windows: gamedev-env\Scripts\activate
echo   - After activation, run this script again to install packages
echo.

REM Core game development libraries
echo ========================================
echo Installing Core Libraries
echo ========================================

REM Pygame - 2D game development
echo Installing Pygame (2D games)...
pip install pygame
echo.

REM Pygame Zero - Simplified 2D game development
echo Installing Pygame Zero (Easy 2D games)...
pip install pgzero
echo.

REM Arcade - Modern 2D game framework
echo Installing Arcade (Modern 2D framework)...
pip install arcade
echo.

REM Panda3D - 3D game engine
echo Installing Panda3D (3D engine)...
pip install panda3d
echo.

REM Ursina - Easy 3D game engine
echo Installing Ursina (Easy 3D engine)...
pip install ursina
echo.

REM PyOpenGL - OpenGL bindings for 3D graphics
echo Installing PyOpenGL (3D graphics)...
pip install PyOpenGL PyOpenGL_accelerate
echo.

REM ModernGL - Modern OpenGL wrapper
echo Installing ModernGL (Modern OpenGL)...
pip install moderngl moderngl-window
echo.

REM Supporting libraries
echo ========================================
echo Installing Supporting Libraries
echo ========================================

REM NumPy - Numerical computing
echo Installing NumPy (Math operations)...
pip install numpy
echo.

REM Pillow - Image processing
echo Installing Pillow (Image processing)...
pip install Pillow
echo.

REM PyGLM - Math library for graphics
echo Installing PyGLM (Graphics math)...
pip install PyGLM
echo.

REM Pymunk - 2D physics
echo Installing Pymunk (2D physics)...
pip install pymunk
echo.

REM PyBullet - 3D physics
echo Installing PyBullet (3D physics)...
pip install pybullet
echo.

REM Noise - Perlin noise for procedural generation
echo Installing Noise (Procedural generation)...
pip install noise
echo.

REM Game development tools
echo ========================================
echo Installing Development Tools
echo ========================================

REM PyTMX - Tiled map loader
echo Installing PyTMX (Tiled map support)...
pip install pytmx
echo.

REM ConfigArgParse - Configuration management
echo Installing ConfigArgParse (Config management)...
pip install configargparse
echo.

REM PyYAML - YAML support for game data
echo Installing PyYAML (Data files)...
pip install pyyaml
echo.

REM Optional: Additional tools
echo ========================================
echo Installing Optional Tools
echo ========================================

REM Pyinstaller - Create executables
echo Installing PyInstaller (Create .exe files)...
pip install pyinstaller
echo.

REM Black - Code formatter
echo Installing Black (Code formatter)...
pip install black
echo.

REM Create example directory structure
echo ========================================
echo Creating Project Structure
echo ========================================

mkdir GameProjects 2>nul
cd GameProjects

REM Create 2D game example
mkdir 2D_Example 2>nul
cd 2D_Example
echo import pygame > main_2d.py
echo import sys >> main_2d.py
echo. >> main_2d.py
echo pygame.init() >> main_2d.py
echo screen = pygame.display.set_mode((800, 600)) >> main_2d.py
echo pygame.display.set_caption("2D Game Example") >> main_2d.py
echo clock = pygame.time.Clock() >> main_2d.py
echo. >> main_2d.py
echo running = True >> main_2d.py
echo while running: >> main_2d.py
echo     for event in pygame.event.get(): >> main_2d.py
echo         if event.type == pygame.QUIT: >> main_2d.py
echo             running = False >> main_2d.py
echo     screen.fill((64, 128, 255))  # Sky blue >> main_2d.py
echo     pygame.display.flip() >> main_2d.py
echo     clock.tick(60) >> main_2d.py
echo. >> main_2d.py
echo pygame.quit() >> main_2d.py
echo sys.exit() >> main_2d.py
cd ..

REM Create 3D game example
mkdir 3D_Example 2>nul
cd 3D_Example
echo from ursina import * > main_3d.py
echo. >> main_3d.py
echo app = Ursina() >> main_3d.py
echo. >> main_3d.py
echo # Create a cube >> main_3d.py
echo cube = Entity(model='cube', color=color.orange, scale=2) >> main_3d.py
echo. >> main_3d.py
echo # Create ground >> main_3d.py
echo ground = Entity(model='plane', scale=10, color=color.gray, texture='grass') >> main_3d.py
echo. >> main_3d.py
echo # Add camera controller >> main_3d.py
echo EditorCamera() >> main_3d.py
echo. >> main_3d.py
echo def update(): >> main_3d.py
echo     cube.rotation_y += 1 >> main_3d.py
echo. >> main_3d.py
echo app.run() >> main_3d.py
cd ..

cd ..

REM Create a test script
echo ========================================
echo Creating Test Script
echo ========================================

echo print("Testing installed libraries...") > test_libs.py
echo print("-" * 40) >> test_libs.py
echo. >> test_libs.py
echo try: >> test_libs.py
echo     import pygame >> test_libs.py
echo     print("[OK] Pygame:", pygame.version.ver) >> test_libs.py
echo except: >> test_libs.py
echo     print("[FAIL] Pygame not installed") >> test_libs.py
echo. >> test_libs.py
echo try: >> test_libs.py
echo     import arcade >> test_libs.py
echo     print("[OK] Arcade:", arcade.VERSION) >> test_libs.py
echo except: >> test_libs.py
echo     print("[FAIL] Arcade not installed") >> test_libs.py
echo. >> test_libs.py
echo try: >> test_libs.py
echo     import ursina >> test_libs.py
echo     print("[OK] Ursina installed") >> test_libs.py
echo except: >> test_libs.py
echo     print("[FAIL] Ursina not installed") >> test_libs.py
echo. >> test_libs.py
echo try: >> test_libs.py
echo     import panda3d >> test_libs.py
echo     print("[OK] Panda3D installed") >> test_libs.py
echo except: >> test_libs.py
echo     print("[FAIL] Panda3D not installed") >> test_libs.py
echo. >> test_libs.py
echo print("-" * 40) >> test_libs.py

echo.
echo Running library test...
python test_libs.py

echo.
echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo Installed libraries:
echo - 2D: Pygame, Pygame Zero, Arcade
echo - 3D: Panda3D, Ursina, PyOpenGL, ModernGL
echo - Physics: Pymunk (2D), PyBullet (3D)
echo - Tools: NumPy, Pillow, PyGLM, etc.
echo.
echo Example projects created in GameProjects folder:
echo - 2D_Example\main_2d.py - Simple Pygame window
echo - 3D_Example\main_3d.py - Simple Ursina 3D scene
echo.
echo To start developing:
echo 1. Activate virtual environment: gamedev-env\Scripts\activate
echo 2. Navigate to GameProjects folder
echo 3. Run: python 2D_Example\main_2d.py or python 3D_Example\main_3d.py
echo.