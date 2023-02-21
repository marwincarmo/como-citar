library(shiny)
library(RefManageR)
library(shinythemes)
library(htmltools)

# Defina as opções dos menus
referencias_opcoes2 <-  c("Artigo científico em periódico com 1 autor",
                       "Artigo científico em periódico com 2 a 3 autores", 
                       "Artigo científico em periódico com até 4 autores",
                       "Artigo científico em periódico com até 5 autores",
                       "Artigo científico em periódico com até 6 autores",
                       "Artigo científico em periódico com até 9 autores",
                       "Artigo científico em periódico com até 10 autores",
                       "Artigo científico em periódico com até 20 autores",
                       "Artigo científico em periódico com 21+ autores", 
                       "Artigo de enciclopédia ou dicionário",
                       "Artigo de jornal online", 
                       "Artigo de revista online", 
                       "Blog post", 
                       "Capítulo de livro", 
                       "Entrevista pessoal", 
                       "Exposição de arte", 
                       "Filme ou vídeo",
                       "Folheto", 
                       "Legislação", 
                       "Livro", 
                       "Mensagem em fórum online",
                       "Música ou álbum de música", 
                       "Obra de teatro", "Patente",
                       "Programa de televisão ou rádio", 
                       "Página da web", 
                       "Relatório governamental", 
                       "Tese ou dissertação")

referencias_opcoes <- c("Artigo" = "CitekeyArticle",
                        "Artigo no prelo" = "CitekeyArticleInPress",
                        "Artigo com dois autores" = "CitekeyArticle2",
                        "Artigo três ou mais autores" = "CitekeyArticle3",
                        "Artigo com 21 ou mais autores" = "CitekeyArticle21",
                        "Autor institucional" = "CitekeyGroupBook",
                        "Livro" = "CitekeyBook",
                        "Booklet" = "CitekeyBooklet",
                        "Capítulo de livro" = "CitekeyInbook",
                        "Trabalho publicado em congressos" = "CitekeyInproceedings",
                        "Manual" = "CitekeyManual",
                        "Dissertação de mestrado" = "CitekeyMastersthesis",
                        #"Misc" = "CitekeyMisc",
                        "Tese de doutorado" = "amaral15",
                        "Anais de congressos" = "CitekeyProceedings",
                        "Relatório técnico" = "CitekeyTechreport",
                        "Trabalho não publicado" = "CitekeyUnpublished",
                        "Artigo de Blog, Revista ou Jornal online" = "blogpost",
                        "Artigo de revista" = "magazine",
                        "Artigo de jornal" = "newspaper",
                        "Dicionario" = "dictionary"
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