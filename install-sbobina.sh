#!/bin/bash
# Installazione semplice YouTube Transcriber con pulizia automatica

echo "🚀 Installando YouTube Transcriber..."

# Pulizia automatica vecchie installazioni
echo "🧹 Pulizia vecchie installazioni..."

# Rimuovi vecchia installazione Homebrew se presente
if brew list youtube-transcriber &>/dev/null; then
    echo "  ❌ Rimuovendo vecchia installazione Homebrew..."
    brew uninstall youtube-transcriber --ignore-dependencies 2>/dev/null || true
fi

# Rimuovi vecchi file in conflitto
echo "  🗑️ Rimuovendo file in conflitto..."
sudo rm -f /opt/homebrew/bin/transcribe* /opt/homebrew/bin/sbobina* /opt/homebrew/bin/trascrivi* /opt/homebrew/bin/yt-* 2>/dev/null || true
sudo rm -f /usr/local/bin/transcribe-wrapper 2>/dev/null || true

# Rimuovi vecchie directory di sviluppo e temp
rm -rf ~/youtube-transcriber-dev ~/youtube-transcriber-brew ~/homebrew-tap ~/temp-repo* 2>/dev/null || true

echo "✅ Pulizia completata"

# Installa dipendenze
echo "📦 Installando dipendenze..."
brew install yt-dlp ffmpeg python3

# Installa moduli Python
echo "🐍 Installando moduli Python..."
python3 -m pip install --break-system-packages --upgrade requests openai

# Scarica script
echo "⬇️ Scaricando script principale..."
curl -o /tmp/transcribe https://raw.githubusercontent.com/ripolissimogit/youtube-transcriber/main/transcribe
sudo mv /tmp/transcribe /usr/local/bin/sbobina
sudo chmod +x /usr/local/bin/sbobina

# Crea alias
echo "🔗 Creando comandi alias..."
sudo ln -sf /usr/local/bin/sbobina /usr/local/bin/trascrivi-url
sudo ln -sf /usr/local/bin/sbobina /usr/local/bin/yt-trascrivi  
sudo ln -sf /usr/local/bin/sbobina /usr/local/bin/transcribe

echo "✅ Installazione completata!"
echo ""
echo "🔧 Verifica configurazione API Keys:"
if [ -n "$GROQ_API_KEY" ] && [ -n "$OPENAI_API_KEY" ]; then
    echo "✅ API Keys già configurate"
else
    echo "⚠️ Configura le chiavi API:"
    echo "export GROQ_API_KEY='la_tua_chiave'"
    echo "export OPENAI_API_KEY='la_tua_chiave'"
fi
echo ""
echo "🎯 Comandi disponibili:"
echo "sbobina https://youtube.com/watch?v=VIDEO_ID"
echo "trascrivi-url https://youtube.com/watch?v=VIDEO_ID"
echo "yt-trascrivi https://youtube.com/watch?v=VIDEO_ID"
echo "transcribe https://youtube.com/watch?v=VIDEO_ID"
