#!/bin/bash

# The various directories that can provide shader caches
CACHE_DIRS=(
    ".cache/nvidia" 
    ".cache/dxvk" 
    ".nv/GLCache" 
    ".nv/ComputeCache" 
    ".cache/mesa_shader_cache" 
    ".cache/mesa_shader_cache_db" 
    ".cache/vulkan_pipeline_cache" 
    ".steam/steam/steamapps/shadercache" 
    ".local/share/Steam/steamapps/shadercache" 
)

TOTAL_FREED=0
TOTAL_DELETED=0
TOTAL_SKIPPED=0
TOTAL_FAILED=0

echo -e "╔═══════════════════════════════════════════╗\n║                                           ║\n║  ███████╗ ██████╗ █████╗ ██████╗          ║\n║  ██╔════╝██╔════╝██╔══██╗██╔══██╗         ║\n║  ███████╗██║     ███████║██████╔╝         ║\n║  ╚════██║██║     ██╔══██║██╔══██╗         ║\n║  ███████║╚██████╗██║  ██║██║  ██║         ║\n║  ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝         ║\n║                                           ║\n║   Shader Cache Auto Refresh               ║\n╚═══════════════════════════════════════════╝\n"

# Go through all local user directories
for user_home in /home/*; do
    [ -d "$user_home" ] || continue
    username=$(basename "$user_home")

    echo ""
    echo "┌─ User: $username"
    echo "│"

    for dir in "${CACHE_DIRS[@]}"; do
        full_path="${user_home}/${dir}"

        if [ -d "$full_path" ]; then
            size_bytes=$(du -sb "$full_path" 2>/dev/null | cut -f1)
            size_human=$(du -sh "$full_path" 2>/dev/null | cut -f1)

            rm -rf "$full_path"

            if [ ! -d "$full_path" ]; then
                echo "│  ✅ DELETED     │ ${size_human} │ ${full_path}"
                TOTAL_FREED=$((TOTAL_FREED + size_bytes))
                TOTAL_DELETED=$((TOTAL_DELETED + 1))
            else
                echo "│  ❌ ERROR       │ ${size_human} │ ${full_path}"
                TOTAL_FAILED=$((TOTAL_FAILED + 1))
            fi
        else
            echo "│  ⏭  SKIPPED    │ n/a    │ ${full_path} (not available)"
            TOTAL_SKIPPED=$((TOTAL_SKIPPED + 1))
        fi
    done

    echo "│"
    echo "└───────────────────────────────────────────────────────────"
done

# Convert total size to human-readable format
if [ "$TOTAL_FREED" -gt 0 ] 2>/dev/null; then
    TOTAL_HUMAN=$(numfmt --to=iec --suffix=B "$TOTAL_FREED" 2>/dev/null || echo "${TOTAL_FREED} Bytes")
else
    TOTAL_HUMAN="0 B"
fi

echo ""
echo "════════════════════════════════════════════════════════════"
echo "  S U M M A R Y "
echo "────────────────────────────────────────────────────────────"
echo "  Deleted: $TOTAL_DELETED directories"
echo "  Skipped: $TOTAL_SKIPPED directories"
echo "  Failed : $TOTAL_FAILED directories"
echo "  Freed  : $TOTAL_HUMAN"
echo "════════════════════════════════════════════════════════════"
echo ""

# For executing via desktop shortcut, pause the script so that the user can see the results
read -n 1 -s -r -p ">>> Press any key to close the window <<<"
