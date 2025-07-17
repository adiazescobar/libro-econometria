# LIMPIAR CACHE ANTIGUO ------------------------------------------------------
unlink(c("main_cache", "main_files"), recursive = TRUE)

# LIMPIAR LIBRO Y RENDERIZAR ------------------------------------------------
bookdown::clean_book()
bookdown::render_book("index.Rmd", "bookdown::gitbook")
options(bookdown.clean_book = TRUE)

# COPIAR ARCHIVOS A /docs PARA GITHUB PAGES ---------------------------------
system("rsync -av --delete _book/ docs/")

# AGREGAR .nojekyll PARA EVITAR ERRORES CON CARPETAS CON "_" ----------------
file.create("docs/.nojekyll")

# SUBIR A GITHUB ------------------------------------------------------------
system("git add .")
system('git commit -m "Render y subida del libro completa"')
system("git push origin main")

# MENSAJE DE ÉXITO ----------------------------------------------------------
cat("✅ Libro renderizado y subido exitosamente a la rama 'main'.\n")
# LIMPIAR ARCHIVOS TEMPORALES ------------------------------------------------
unlink(c("docs", "main_cache", "main_files"), recursive = TRUE)
# Mensaje de éxito final
cat("✅ Archivos temporales eliminados.\n")
# Fin del script

