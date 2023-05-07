# Instale e carregue o pacote Shiny
if(!require(shiny)){
    install.packages("shiny")
}
library(shiny)

# Defina o UI do aplicativo Shiny
ui <- fluidPage(
    # Adicione um estilo para as caixas dos tópicos
    tags$head(tags$style(
        type = "text/css",
        HTML(".box { 
       background-color: navyblue !important;
       color: black;
       padding: 10px;
       margin: 20px 0px;
       border-radius: 5px;
     }")
    )),
    
    # Selecione o teste a ser analisado
    selectInput("teste", label = "Selecione o teste:",
                choices = c("Correlação de Pearson", "Regressão Linear Simples")),
    
    
    # Seção para "Correlação de Pearson"
    conditionalPanel(condition = "input.teste == 'Correlação de Pearson'",
                     div(class = "box",
                         h3("Correlação de Pearson"),
                         p("A correlação de Pearson é um teste estatístico usado para medir a relação entre duas variáveis contínuas."),
                         h3("Quando usar"),
                         p("A correlação de Pearson é usada para medir a força e a direção da relação entre duas variáveis contínuas quando ambas as variáveis são distribuídas normalmente."),
                         h3("Tipos de variáveis necessárias"),
                         p("A correlação de Pearson requer duas variáveis contínuas."),
                         h3("Pressupostos"),
                         p("Os pressupostos para a correlação de Pearson incluem normalidade, linearidade e homogeneidade de variâncias."),
                         h3("Um exemplo de pesquisa"),
                         p("Um exemplo de pesquisa que utiliza a correlação de Pearson pode ser uma análise de dados para determinar se há uma relação entre a altura e o peso de um grupo de pessoas.")
                     )
    ),
    
    # Seção para "Regressão Linear Simples"
    conditionalPanel(condition = "input.teste == 'Regressão Linear Simples'",
                     div(class = "box",
                         h3("Regressão Linear Simples"),
                         p("A regressão linear simples é um teste estatístico usado para determinar a relação entre uma variável contínua dependente e uma variável contínua independente."),
                         h3("Quando usar"),
                         p("A regressão linear simples é usada para determinar a relação entre uma variável contínua dependente e uma variável contínua independente quando a relação entre elas é linear."),
                         h3("Tipos de variáveis necessárias"),
                         p("A regressão linear simples requer uma variável contínua dependente e uma variável contínua independente."),
                         h3("Pressupostos"),
                         p("Os pressupostos para a regressão linear simples incluem normalidade, homoscedasticidade, independência e linearidade."),
                         h3("Um exemplo de pesquisa"),
                         p("Um exemplo de pesquisa que utiliza a regressão linear simples pode ser uma análise de dados para determinar se há uma relação entre o tempo de estudo e a nota obtida em uma prova.")
                     )
    )
)

# Defina o Server do aplicativo Shiny
server <- function(input, output) {}

# Rode o aplicativo Shiny
shinyApp(ui = ui, server = server)