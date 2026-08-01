#!/bin/bash
# Revisa que todas las figuras del libro publicado carguen de verdad.
# El libro puede verse perfecto en el computador y estar roto en el servidor.
B="${1:-https://www.adiazescobar.com/libro-econometria}"
tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT
curl -s "$B/" -o "$tmp/i.html" || { echo "No se pudo abrir $B"; exit 1; }
caps=$(grep -o 'href="[a-z0-9-]*\.html"' "$tmp/i.html" | sed 's/href="//;s/"//' | sort -u)
tot=0; mal=0
for c in $caps; do
  curl -s "$B/$c" -o "$tmp/p.html" || continue
  for src in $(grep -o '<img[^>]*src="[^"]*"' "$tmp/p.html" | sed 's/.*src="//;s/"//'); do
    tot=$((tot+1))
    code=$(curl -s -o /dev/null -w '%{http_code}' "$B/$src")
    [ "$code" = "200" ] || { mal=$((mal+1)); echo "  ROTA  $c -> $src [$code]"; }
  done
done
echo ""
echo "  capitulos: $(echo "$caps" | wc -w | tr -d ' ')  imagenes: $tot  rotas: $mal"
[ "$mal" -eq 0 ] && echo "  Todo bien." || exit 1
