# ============================================================
#  🏆 Torneo de Estimadores — Shiny App para clase
#  Gauss-Markov: MCO vs Estimador de Wald
# ------------------------------------------------------------
#  CÓMO USARLO EN CLASE:
#  1. Corre en R: shiny::runApp("torneo_estimadores", host = "0.0.0.0", port = 3838)
#  2. Busca tu IP local: en Mac, System Settings → WiFi → Details
#     O corre en Terminal: ipconfig getifaddr en0
#  3. Comparte con estudiantes: http://[tu-IP]:3838
#  4. Muestra el histograma en tu pantalla (el tuyo se actualiza solo)
#  5. Cuando todos hayan votado, presiona "Revelar resultado"
# ============================================================

library(shiny)
library(ggplot2)

# Respuesta correcta (seed 42, n=50, B=2000, beta1=2)
VICTORIAS_MCO <- 1162
TOTAL_RONDAS  <- 2000

# ── Estado compartido entre TODAS las sesiones ──────────────
respuestas <- reactiveValues(votos = c())

# ── UI ──────────────────────────────────────────────────────
ui <- fluidPage(

  tags$head(tags$style(HTML("
    * { box-sizing: border-box; }
    body {
      font-family: 'Helvetica Neue', Arial, sans-serif;
      background: #f0f4f8;
      margin: 0; padding: 0;
    }
    .encabezado {
      background: #1565C0;
      color: white;
      text-align: center;
      padding: 20px 10px 15px;
    }
    .encabezado h1 { margin: 0; font-size: 26px; }
    .encabezado p  { margin: 6px 0 0; font-size: 15px; opacity: 0.85; }

    .card {
      background: white;
      border-radius: 12px;
      padding: 22px 26px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.08);
      margin: 18px auto;
      max-width: 580px;
    }
    .card h3 { margin-top: 0; color: #1565C0; }

    .btn-enviar {
      background: #1565C0 !important;
      color: white !important;
      border: none !important;
      padding: 11px 28px !important;
      border-radius: 7px !important;
      font-size: 16px !important;
      width: 100%;
      margin-top: 10px;
    }
    .btn-revelar {
      background: #C62828 !important;
      color: white !important;
      border: none !important;
      padding: 10px 24px !important;
      border-radius: 7px !important;
      font-size: 15px !important;
    }
    .btn-reset {
      background: #555 !important;
      color: white !important;
      border: none !important;
      padding: 8px 18px !important;
      border-radius: 6px !important;
      font-size: 13px !important;
      margin-left: 10px;
    }
    .resultado-box {
      background: #fff8e1;
      border-left: 5px solid #C62828;
      border-radius: 8px;
      padding: 18px 22px;
      margin: 18px auto;
      max-width: 580px;
    }
    .resultado-box h2 { color: #C62828; margin-top: 0; }
    .confirmado { color: #2e7d32; font-weight: bold; margin-top: 8px; }
    .error-msg  { color: #C62828; margin-top: 8px; }
  "))),

  # ── Encabezado ─────────────────────────────────────────────
  div(class = "encabezado",
    tags$h1("🏆 El gran torneo de estimadores"),
    tags$p("MCO vs Estimador de Wald — 2,000 rondas")
  ),

  # ── Panel de votación ──────────────────────────────────────
  div(class = "card",
    tags$h3("🎮 Haz tu apuesta"),
    tags$p("En 2,000 muestras distintas, MCO y el estimador de Wald compiten.
            El ganador de cada ronda es quien se acerque más al valor verdadero
            β₁ = 2. ¿Cuántas rondas crees que gana MCO?"),
    numericInput("voto",
                 label    = "Mi predicción (entre 0 y 2,000):",
                 value    = NA,
                 min      = 0,
                 max      = 2000,
                 step     = 1,
                 width    = "100%"),
    actionButton("enviar", "📩 Enviar mi apuesta", class = "btn-enviar"),
    uiOutput("confirmacion")
  ),

  # ── Histograma en vivo ─────────────────────────────────────
  div(class = "card",
    tags$h3("📊 Apuestas en vivo"),
    uiOutput("contador"),
    plotOutput("histograma", height = "360px"),
    br(),
    div(style = "text-align: center;",
      actionButton("revelar", "🎯 Revelar resultado real", class = "btn-revelar"),
      actionButton("reset",   "↺ Reiniciar",               class = "btn-reset")
    )
  ),

  # ── Resultado real (oculto hasta que el profe presione el botón) ──
  uiOutput("resultado_real")
)

# ── Server ───────────────────────────────────────────────────
server <- function(input, output, session) {

  # Registrar voto
  observeEvent(input$enviar, {
    v <- input$voto
    if (is.na(v) || v < 0 || v > 2000) {
      output$confirmacion <- renderUI(
        tags$p(class = "error-msg", "⚠️ Ingresa un número entre 0 y 2,000.")
      )
    } else {
      respuestas$votos <- c(respuestas$votos, round(v))
      output$confirmacion <- renderUI(
        tags$p(class = "confirmado",
               paste0("✅ Apuesta registrada: ", round(v), " victorias para MCO"))
      )
    }
  })

  # Reiniciar votos
  observeEvent(input$reset, {
    respuestas$votos <- c()
    rv_revelar(FALSE)
    output$confirmacion <- renderUI(NULL)
  })

  # Contador
  output$contador <- renderUI({
    invalidateLater(1500, session)
    n <- length(respuestas$votos)
    tags$p(style = "color: #777; font-size: 13px; margin: 0 0 10px;",
           paste0(n, " apuesta(s) recibida(s)"))
  })

  # Histograma en vivo
  output$histograma <- renderPlot({
    invalidateLater(1500, session)
    votos <- respuestas$votos

    if (length(votos) == 0) {
      ggplot() +
        annotate("text", x = 0.5, y = 0.5,
                 label = "Esperando apuestas...",
                 size = 7, color = "gray70") +
        theme_void()
    } else {
      media <- round(mean(votos))
      ggplot(data.frame(v = votos), aes(x = v)) +
        geom_histogram(binwidth = 100, fill = "#1565C0",
                       alpha = 0.75, color = "white", boundary = 0) +
        geom_vline(xintercept = 1000, linetype = "dashed",
                   color = "gray50", linewidth = 0.9) +
        geom_vline(xintercept = media, linetype = "solid",
                   color = "#FF6F00", linewidth = 1.1) +
        annotate("text", x = 1015, y = Inf,
                 label = "50% (puro azar)", hjust = 0, vjust = 2,
                 color = "gray50", size = 3.8) +
        annotate("text", x = media + 15, y = Inf,
                 label = paste0("Promedio: ", media), hjust = 0, vjust = 4,
                 color = "#FF6F00", size = 3.8, fontface = "bold") +
        scale_x_continuous(limits = c(0, 2000),
                           breaks = seq(0, 2000, 400)) +
        labs(x = "Victorias predichas para MCO (de 2,000)",
             y = "Número de estudiantes") +
        theme_minimal(base_size = 13) +
        theme(panel.grid.minor = element_blank())
    }
  })

  # Revelar resultado
  rv_revelar <- reactiveVal(FALSE)
  observeEvent(input$revelar, { rv_revelar(TRUE) })

  output$resultado_real <- renderUI({
    req(rv_revelar())
    pct <- round(100 * VICTORIAS_MCO / TOTAL_RONDAS, 1)
    n   <- length(respuestas$votos)

    # Promedio de las apuestas
    resumen <- if (n > 0) {
      paste0(" — El promedio de sus apuestas fue ",
             round(mean(respuestas$votos)), ".")
    } else ""

    div(class = "resultado-box",
      tags$h2(paste0("🎯 MCO ganó ", VICTORIAS_MCO,
                     " de ", TOTAL_RONDAS, " rondas (", pct, "%)")),
      tags$p(paste0("El estimador de Wald ganó solo ",
                    TOTAL_RONDAS - VICTORIAS_MCO, " rondas (",
                    100 - pct, "%).", resumen)),
      tags$p(style = "color: #555; font-style: italic;",
             "Esto no es casualidad: el teorema de Gauss-Markov garantiza que
              MCO gana más rondas que cualquier otro estimador lineal insesgado.")
    )
  })
}

shinyApp(ui, server)
