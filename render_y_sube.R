bookdown::render_book("index.Rmd", "bookdown::gitbook")

# Copia robusta usando system (en Mac/Linux)
system("rsync -av --delete _book/ docs/")

# Crear .nojekyll para evitar problemas con carpetas con "_"
file.create("docs/.nojekyll")

# Git push automático
system("git add .")
system('git commit -m "Render y subida del libro completa"')
system("git push origin main")
