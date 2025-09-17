# YouTube Transcriber

Trascrivi video YouTube e file audio usando Groq AI (Whisper).

## Installazione

```bash
brew tap ripolissimogit/tap
brew install youtube-transcriber
```

## Configurazione

Ottieni una chiave API gratuita da [Groq Console](https://console.groq.com/keys):

```bash
export GROQ_API_KEY="la_tua_chiave_groq"
```

## Uso

```bash
# Trascrivi video YouTube
transcribe "https://youtube.com/watch?v=VIDEO_ID"

# Trascrivi file audio locale
transcribe "/path/to/audio.mp3"
```

## Requisiti

- macOS
- Chiave API Groq (gratuita)
- File audio < 25MB (limite Groq)
