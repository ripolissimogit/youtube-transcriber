#!/bin/bash
# Installazione semplice YouTube Transcriber

echo "🚀 Installando YouTube Transcriber..."

# Installa dipendenze
brew install yt-dlp ffmpeg python3

# Installa moduli Python
python3 -m pip install --break-system-packages requests openai

# Scarica script
curl -o /tmp/transcribe https://raw.githubusercontent.com/ripolissimogit/youtube-transcriber/main/transcribe
sudo mv /tmp/transcribe /usr/local/bin/sbobina
sudo chmod +x /usr/local/bin/sbobina

# Crea alias
sudo ln -sf /usr/local/bin/sbobina /usr/local/bin/trascrivi-url
sudo ln -sf /usr/local/bin/sbobina /usr/local/bin/yt-trascrivi  
sudo ln -sf /usr/local/bin/sbobina /usr/local/bin/transcribe

echo "✅ Installazione completata!"
echo ""
echo "🔧 Configura le chiavi API:"
echo "export GROQ_API_KEY='la_tua_chiave'"
echo "export OPENAI_API_KEY='la_tua_chiave'"
echo ""
echo "🎯 Comandi disponibili:"
echo "sbobina https://youtube.com/watch?v=VIDEO_ID"
echo "trascrivi-url https://youtube.com/watch?v=VIDEO_ID"
echo "yt-trascrivi https://youtube.com/watch?v=VIDEO_ID"
echo "transcribe https://youtube.com/watch?v=VIDEO_ID"
