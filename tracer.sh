until mono Tracer2Server.exe; do
    echo "Server 'Tracer2Server' crashed with exit code $?.  Respawning.." >&2
    sleep 1
done
