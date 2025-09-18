# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

YouTube Transcriber is a Python-based CLI tool that transcribes YouTube videos and local audio files using Groq AI's Whisper model for transcription and OpenAI's GPT-4o-mini for transcript improvement and summarization. The tool supports both English (`transcribe`) and Italian (`trascrivi`) commands.

**Repository**: [ripolissimogit/youtube-transcriber](https://github.com/ripolissimogit/youtube-transcriber)
**Installation URL**: `https://raw.githubusercontent.com/ripolissimogit/youtube-transcriber/main/install-sbobina.sh`

## Key Commands

### Setup and Installation
```bash
# Install via installation script
./install-sbobina.sh

# Install directly from GitHub
curl -sSL https://raw.githubusercontent.com/ripolissimogit/youtube-transcriber/main/install-sbobina.sh | bash

# Setup API keys interactively
transcribe --setup
```

### Running the Application
```bash
# Interactive mode (recommended for users)
transcribe
trascrivi

# Direct YouTube transcription
transcribe "https://youtube.com/watch?v=VIDEO_ID"
trascrivi "https://youtu.be/VIDEO_ID"

# Local audio file transcription
transcribe "/path/to/audio.mp3"
trascrivi "/path/to/audio.mp3"

# Help and options
transcribe --help
```

### Development Commands
```bash
# Test the main script
python3 transcribe --help

# Check dependencies
yt-dlp --version
ffmpeg -version
python3 -c "import requests, openai; print('Dependencies OK')"
```

## Architecture

### Core Components

**Main Script (`transcribe`)**: Python 3.13+ script that orchestrates the entire transcription workflow
- YouTube audio extraction via `yt-dlp`
- Audio transcription via Groq Whisper API
- Transcript improvement via OpenAI GPT-4o-mini
- Metadata extraction and formatting
- File output generation

**Italian Alias (`trascrivi`)**: Bash wrapper that redirects to the main `transcribe` script

**Installation Script (`install-sbobina.sh`)**: Automated setup script that:
- Cleans previous installations
- Installs Homebrew dependencies (`yt-dlp`, `ffmpeg`, `python3`)
- Installs Python packages (`requests`, `openai`)
- Creates command aliases and symlinks

### API Integration
- **Groq API**: Used for audio transcription with Whisper-large-v3 model
- **OpenAI API**: Used for transcript improvement and summarization with GPT-4o-mini
- Both APIs require valid keys set as environment variables

### File Processing Flow
1. URL validation and cleaning (YouTube URLs)
2. Audio extraction (YouTube) or file validation (local files)
3. File size validation (25MB Groq limit)
4. Transcription via Groq Whisper
5. Enhancement via OpenAI GPT-4o-mini
6. Summary generation
7. Formatted output file creation

## Environment Requirements

### Required Environment Variables
```bash
export GROQ_API_KEY="your_groq_api_key"
export OPENAI_API_KEY="your_openai_api_key"
```

### System Dependencies
- macOS (primary target platform)
- Homebrew package manager
- Python 3.13+ (user preference)
- Internet connection for API calls

### Python Dependencies
- `requests`: HTTP API calls
- `openai`: OpenAI API client (used for convenience functions)
- Standard library modules: `sys`, `os`, `tempfile`, `subprocess`, `re`, `glob`, `json`, `datetime`

## File Structure

- `transcribe` - Main Python executable script
- `trascrivi` - Italian language alias (bash script)
- `install-sbobina.sh` - Installation and setup script
- `README.md` - User documentation in Italian
- `trascrizione_*.txt` - Output files (auto-generated during usage)

## Output Format

Generated transcription files include:
- Video/file metadata
- Content summary (3 sentences max)
- Improved transcription with proper formatting
- Generation timestamp and tool version info

## Development Notes

### Error Handling
The application implements comprehensive error handling for:
- Missing API keys with interactive setup
- Network connectivity issues
- File size limitations (25MB Groq limit)
- API rate limits and errors
- Invalid URLs or file paths

### Multi-language Support
- Commands available in both English (`transcribe`) and Italian (`trascrivi`)
- Italian language optimization for Whisper transcription
- UI messages primarily in Italian for target user base

### User Experience Features
- Interactive mode for non-technical users
- Automatic URL cleaning (removes tracking parameters)
- Progress indicators during processing
- Automatic file saving with descriptive names