library(shiny)
library(RefManageR)
library(shinythemes)
library(htmltools)

# Defina as opções dos menus

referencias_opcoes <- c("Artigo" = "CitekeyArticle",
                        #"Artigo no prelo" = "CitekeyArticleInPress",
                        "Artigo com dois autores" = "CitekeyArticle2",
                        "Artigo três autores" = "CitekeyArticle3",
                        "Artigo com quatro ou mais autores" = "CitekeyArticle4",
                        "Artigo com 21 ou mais autores" = "CitekeyArticle21",
                        "Autor institucional (livro)" = "CitekeyGroupBook",
                        "Livro" = "CitekeyBook",
                        #"Booklet" = "CitekeyBooklet",
                        "Capítulo de livro" = "CitekeyInbook",
                        "Livro publicado por editores" = "CitekeyProceedings",
                        "Trabalho apresentado em eventos" = "CitekeyInproceedings",
                        #"Manual" = "CitekeyManual",
                        "Dissertação de mestrado" = "CitekeyMastersthesis",
                        #"Misc" = "CitekeyMisc",
                        "Tese de doutorado" = "amaral15",
                        #"Anais de congressos" = "CitekeyProceedings",
                        #"Relatório técnico" = "CitekeyTechreport",
                        "Trabalho não publicado" = "CitekeyUnpublished",
                        "Webpages e Websites" = "blogpost",
                        #"Artigo de revista" = "magazine",
                        #"Artigo de jornal" = "newspaper",
                        #"Dicionario" = "dictionary",
                        "Testes, escalas e inventários sem manual" = "testes"
                        )

normas_opcoes <-  c("ABNT (NBR 6023)" = "associacao-brasileira-de-normas-tecnicas.csl", 
                    "ABNT 2" = "planeta-zotero-abnt.csl",
                    "APA (7th ed.)" = "apa7.csl", 
                    "Vancouver (11th ed.)" = "vancouver.csl", 
                    "Chicago (17th ed.)" = "chicago-author-date.csl",
                    "Chicago PT" = "chicago-pt.csl")

# Cria a user interface  ----- 
ui <- fluidPage(
    
    # Use o theme do shinythemes para alterar a cor de fundo
    
    # Use o verticalLayout para dividir a interface em duas áreas
    verticalLayout(
        
        # Posicione o menu de referências acima e centralizado
        fluidRow(column(4, offset = 4,
                        selectInput("referencias_menu", "Referências:", referencias_opcoes, width = "100%"),
                        selectInput("normas_menu", "Normas:", normas_opcoes, width = "100%")
        )),
        
        # Posicione o texto abaixo e centralizado
        fluidRow(column(8, offset = 3,
                        htmlOutput("report")
        ))
    )
)
server <- function(input, output, session) {
  
        output$report <- renderUI({
            includeHTML(
                rmarkdown::render(
                    "report_template.Rmd",
                    params = list(
                        norma = input$normas_menu,
                        referencias = input$referencias_menu
                    )
                )
            )
        })
    
}

shinyApp(ui, server)