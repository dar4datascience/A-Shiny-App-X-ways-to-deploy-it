box::use(
  shiny[bootstrapPage, div, moduleServer, NS, renderUI, tags, renderText, enableBookmarking, bookmarkButton, textInput, textOutput],
  bslib[bs_themer, page_sidebar, card]
)

enableBookmarking()

#' @export
ui <- function(id) {
  ns <- NS(id)
  page_sidebar(
    title = "Demo",
    sidebar = card(
      bookmarkButton(),
    textInput(ns("name"), "Name")
    ),
    textOutput(ns("message"))
  )
}

#' @export
server <- function(id) {
  bs_themer()
  moduleServer(id, function(input, output, session) {
    output$message <- renderText(paste0("Hello ", input$name, "!"))
  })
}
