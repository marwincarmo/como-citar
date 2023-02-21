# Carregue os pacotes Shiny e shinythemes
library(shiny)
library(shinythemes)

# Defina as opções dos menus
referencias_opcoes = c("Artigo científico em periódico com 1 autor",
                       "Artigo científico em periódico com 2 a 3 autores", 
                       "Artigo científico em periódico com até 4 autores",
                       "Artigo científico em periódico com até 5 autores",
                       "Artigo científico em periódico com até 6 autores",
                       "Artigo científico em periódico com até 9 autores",
                       "Artigo científico em periódico com até 10 autores",
                       "Artigo científico em periódico com até 20 autores",
                       "Artigo científico em periódico com 21+ autores", 
                       "Artigo de enciclopédia ou dicionário",
                       "Artigo de jornal online", "Artigo de revista online", 
                       "Blog post", "Capítulo de livro", "Entrevista pessoal", 
                       "Exposição de arte", "Filme ou vídeo","Folheto", 
                       "Legislação", "Livro", "Mensagem em fórum online",
                       "Música ou álbum de música", "Obra de teatro", "Patente",
                       "Programa de televisão ou rádio", "Página da web", 
                       "Relatório governamental", "Tese ou dissertação")

normas_opcoes = c("ABNT (NBR 6023)", "APA (7th ed.)", "Vancouver (11th ed.)", "Chicago (17th ed.)")

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
                        h3("Referência:"),
                        uiOutput("referencia_texto")
        ))
    )
)

server <- function(input, output) {
    
    # Exiba o texto da referência de acordo com as opções selecionadas
    output$referencia_texto <- renderUI({
        # APA (7th ed.) ----- 
        if (input$referencias_menu == "Artigo científico em periódico com 1 autor" && input$normas_menu == "APA (7th ed.)") {
            list(paste0("Autor, A. A. (Ano). Título do artigo. Título do artigo. ", em("Nome do periódico,"), em("volume"),"(número), página inicial-página final. https://doi.org/xxxxx."), 
                 paste0(strong("Exemplo:"), " Smith, J. (2020). Os benefícios do exercício regular para a saúde mental. ", em("Jornal da Saúde, "), em("25"),"(2) 12-15. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com 2 a 3 autores" && input$normas_menu == "APA (7th ed.)") {
            list(paste0("Autor, A. A., Autor, B. B., & Autor, C. C. (Ano). Título do artigo. ", em("Nome do periódico, "), em("volume"),"(número), página inicial-página final. https://doi.org/xxxxx."), 
                 paste0(strong("Exemplo:"), " Smith, J., Johnson, K., & Williams, M. (2020). A importância do sono para a memória. ", em("Jornal da Saúde, "), em("25"),"(3), 16-20. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 4 autores" && input$normas_menu == "APA (7th ed.)") {
            list(paste0("Autor, A. A., Autor, B. B., Autor, C. C., & Autor, D. D. (Ano). Título do artigo. ", em("Nome do periódico, "), em("volume"),"(número), página inicial-página final. https://doi.org/xxxxx."), 
                 paste0(strong("Exemplo:"), " Smith, J., Johnson, K., Williams, M., & Portnoy, M. (2020). A importância do sono para a memória. ", em("Jornal da Saúde, "), em("25"),"(3), 16-20. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 5 autores" && input$normas_menu == "APA (7th ed.)") {
            list(paste0("Autor, A. A., Autor, B. B., Autor, C. C., Autor, D. D., & Autor, E. E. (Ano). Título do artigo. ", em("Nome do periódico, "), em("volume"),"(número), página inicial-página final. https://doi.org/xxxxx."), 
                 paste0(strong("Exemplo:"), " Smith, J., Johnson, K., Williams, M. Labrie, J., & Petrucci, J. (2020). A importância do sono para a memória. ", em("Jornal da Saúde, "), em("25"),"(3), 16-20. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 6 autores" && input$normas_menu == "APA (7th ed.)") {
            list(paste0("Autor, A. A., Autor, B. B., Autor, C. C., Autor, D. D., Autor, E. E., & Autor, F. F. (Ano). Título do artigo. ", em("Nome do periódico, "), em("volume"),"(número), página inicial-página final. https://doi.org/xxxxx."), 
                 paste0(strong("Exemplo:"), " Smith, J., Johnson, K., Williams, M., Labrie, J., Myung, J., & Petrucci, J. (2020). A importância do sono para a memória. ", em("Jornal da Saúde, "), em("25"),"(3), 16-20. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 9 autores" && input$normas_menu == "APA (7th ed.)") {
            list(paste0("Autor, A. A., Autor, B. B., Autor, C. C., Autor, D. D., Autor, E. E., Autor, F. F., Autor, G. G., Autor, H. H., & Autor, I. I. (Ano). Título do artigo. ", em("Nome do periódico, "), em("volume"),"(número), página inicial-página final. https://doi.org/xxxxx."), 
                 paste0(strong("Exemplo:"), " Smith, J., Johnson, K., Williams, M., Labrie, J., Myung, J., Petrucci, J., Portnoy, M., Mangini, M., & Collins, C. (2020). A importância do sono para a memória. ", em("Jornal da Saúde, "), em("25"),"(3), 16-20. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 10 autores" && input$normas_menu == "APA (7th ed.)") {
            list(paste0("Autor, A. A., Autor, B. B., Autor, C. C., Autor, D. D., Autor, E. E., Autor, F. F., Autor, G. G., Autor, H. H., Autor, I. I., & Autor, J. J. (Ano). Título do artigo. ", em("Nome do periódico, "), em("volume"),"(número), página inicial-página final. https://doi.org/xxxxx."), 
                 paste0(strong("Exemplo:"), " Smith, J., Johnson, K., Williams, M., Labrie, J., Myung, J., Petrucci, J., Portnoy, M., Mangini, M., Collins, C., & Dominici, C. (2020). A importância do sono para a memória. ", em(" Jornal da Saúde, "), em("25"),"(3), 16-20. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 20 autores" && input$normas_menu == "APA (7th ed.)") {
            list(paste0("Autor, A. A., Autor, B. B., Autor, C. C., Autor, D. D., Autor, E. E., Autor, F. F., Autor, G. G., Autor, H. H., Autor, I. I., Autor, J. J., Autor, K. K., Autor, L. L., Autor, M. M., Autor, N. N., Autor, O. O., Autor, P. P., Autor, Q. Q., Autor, R. R., Autor, S. S., &  Autor, T. T.  (Ano). Título do artigo. ", em("Nome do periódico, "), em("volume"),"(número), página inicial-página final. https://doi.org/xxxxx."), 
                 paste0(strong("Exemplo:"), " Smith, J., Johnson, K., Williams, M., Labrie, J., Myung, J., Petrucci, J., Portnoy, M., Mangini, M., Collins, C., Dominici, C., Moore, K., Sherinian, D., Harris, S., Dickinson, B., Smith, A., McBrain, N., Gers, J., Di'Anno, P., Dio, R. J., &  Halford, R.  (2020). A importância do sono para a memória. ", em("Jornal da Saúde, "), em("25"),"(3), 16-20. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com 21+ autores" && input$normas_menu == "APA (7th ed.)") {
            list(paste0("Autor, A. A., Autor, B. B., Autor, C. C., Autor, D. D., Autor, E. E., Autor, F. F., Autor, G. G., Autor, H. H., Autor, I. I., Autor, J. J., Autor, K. K., Autor, L. L., Autor, M. M., Autor, N. N., Autor, O. O., Autor, P. P., Autor, Q. Q., Autor, R. R., Autor, S. S., ...  Autor, Z. Z.  (Ano). Título do artigo. ", em("Nome do periódico, "), em("volume"),"(número), página inicial-página final. https://doi.org/xxxxx."), 
                 paste0(strong("Exemplo:"), " Smith, J., Johnson, K., Williams, M., Labrie, J., Myung, J., Petrucci, J., Portnoy, M., Mangini, M., Collins, C., Dominici, C., Moore, K., Sherinian, D., Harris, S., Dickinson, B., Smith, A., McBrain, N., Gers, J., Di'Anno, P., Dio, R. J., ...  Halford, R.  (2020). A importância do sono para a memória. ", em("Jornal da Saúde, "), em("25"),"(3), 16-20. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu  == "Artigo de enciclopédia ou dicionário" && input$normas_menu == "APA (7th ed.)") {
            list(p("Autor, A. A. (Ano). In ", em("Nome da enciclopédia ou dicionário. "), "Recuperado em Mês, dia, ano, URL."), 
                 p(strong("Exemplo:"), " Smith, J. (2020). In ", em("Dicionário de Saúde. "), "Recuperado em Junho 14, 2022, https://dicionariodasaude.org/"))
            
        } else if (input$referencias_menu  == "Artigo de jornal online" && input$normas_menu == "APA (7th ed.)") {
            list(p("Autor, A. A. (Ano, Mês dia). Título do artigo. ", em(" Nome do jornal. "), "URL."), 
                 p(strong("Exemplo:"), " Smith, J. (2020, Janeiro 3). Os benefícios do exercício regular para a saúde mental. ", em("Jornal da Saúde "), "https://www.jornaldasaude.com/exercicio-e-saude-mental."))
            
        } else if (input$referencias_menu  == "Artigo de revista online" && input$normas_menu == "APA (7th ed.)") {
            list(p("Autor, A. A. (Ano, Mês dia). Título do artigo. ", em("Nome da revista. "), "URL."), 
                 p(strong("Exemplo:"), " Smith, J. (2020, Janeiro 3). Os benefícios do exercício regular para a saúde mental. ", em("Revista da Saúde. "), "https://www.revistadasaude.com/exercicio-e-saude-mental."))
            
        } else if (input$referencias_menu  == "Blog post" && input$normas_menu == "APA (7th ed.)") {
            list(p("Autor, A. A. (Ano, Mês dia). Título do post. ", em("Nome do blog. "), " URL."), 
                 p(strong("Exemplo:"), " Smith, J. (2020, Janeiro 3). Os benefícios do exercício regular para a saúde mental. ", em("Blog da Saúde. "), "https://www.blogdasaude.com/exercicio-e-saude-mental."))
            
        } else if (input$referencias_menu  == "Capítulo de livro" && input$normas_menu == "APA (7th ed.)") {
            list(p("Autor, A. do capítulo. (Ano). Título do capítulo. In A. A. Editor (Ed.), ", em(" Título do livro"), " (número da edição, páginas do capítulo). Editora."), 
                 p(strong("Exemplo:"), " Smith, J. (2020). Os benefícios do exercício para a saúde mental. In K. Johnson (Ed.), ", em(" Guia de saúde mental"), " (2 ed., pp. 45-50). Editora da Saúde."))
            
        } else if (input$referencias_menu  == "Entrevista pessoal" && input$normas_menu == "APA (7th ed.)") {
            list(p("Entrevistado, A. (Ano, Mês Dia). ", em("Título da entrevista. "), "Entrevistador. URL."), 
                 p(strong("Exemplo:"), " John Smith. (2020, Julho 12). ", em("Entrevista sobre os benefícios do exercício para a saúde mental. "), "Revista da Saúde. https://www.revistadasaude.com/entrevista. "))
            
        } else if (input$referencias_menu  == "Exposição de arte" && input$normas_menu == "APA (7th ed.)") {
            list(p("Artista. A. (Ano). ", em("Título da obra"), " [Tipo]. Local da Exposição."), 
                 p(strong("Exemplo:"), " Smith, J. (2020). ", em("Pinturas de paisagens"), " [Pintura]. Museu de Arte Moderna, Nova York, Estados Unidos."))
            
        } else if (input$referencias_menu  == "Filme ou vídeo" && input$normas_menu == "APA (7th ed.)") {
            list(p("Diretor, A. A. (Diretor). (Ano).", em(" Título do filme"), " [Formato]. País: Empresa produtora."), 
                 p(strong("Exemplo:"), "Smith, J. (Diretor). (2020).", em(" Os benefícios do exercício para a saúde mental"), "[Filme]. Estados Unidos: Empresa da Saúde."))
            
        } else if (input$referencias_menu  == "Folheto" && input$normas_menu == "APA (7th ed.)") {
            list(p("Autor. A. (Ano, Mês). ", em("Título do folheto."), "[Folheto]. Editora."), 
                 p(strong("Exemplo:"), " Smith, J. (2020, Abril). ", em("Os benefícios do exercício para a saúde mental "), "[Folheto]. Editora da Saúde."))
            
        } else if (input$referencias_menu  == "Legislação" && input$normas_menu == "APA (7th ed.)") {
            list(p("Nome da lei, Número do documento Sigla do País. § Número da seção (Ano). URL."), 
                 p(strong("Exemplo:"), " Anti-Smuggling Act, 19 U.S.C. § 1701 (1935). https://www.loc.gov/item/uscode1958-004019005/"))
            
        } else if (input$referencias_menu  == "Livro" && input$normas_menu == "APA (7th ed.)") {
            list(p("Autor, A. A. (Ano). ", em("Título do livro"), " (Edição). Editora. https://doi.org/xxxxx"), 
                 p(strong("Exemplo:"), " Smith, J. (2020). ", em("Os benefícios do exercício para a saúde mental"), " (1 ed.). Editora da Saúde. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu  == "Mensagem em fórum online" && input$normas_menu == "APA (7th ed.)") {
            list(p("Autor. A. (Ano, Mês Dia). ", em("Título da mensagem "), "[Fórum]. URL."), 
                 p(strong("Exemplo:"), " Smith, J. (2020, Junho 14). ", em("Os benefícios do exercício para a saúde mental"), "  [Fórum da Saúde]. https://www.forumdasaude.com/threads/exercicio-saude-mental.12345/"))
            
        } else if (input$referencias_menu  == "Música ou álbum de música" && input$normas_menu == "APA (7th ed.)") {
            list(p("Artista. A. (Ano). ", em("Nome da música "), "[Álbum]. Gravadora"), 
                 p(strong("Exemplo:"), " Bowie, D. (2016). ", em(" Blackstar "), "[Album]. Columbia"))
            
        } else if (input$referencias_menu  == "Obra de teatro" && input$normas_menu == "APA (7th ed.)") {
            list(p("Autor. A. (Ano). ", em("Título da obra. " ), "Editor."), 
                 p(strong("Exemplo:"), " Smith, J. (2020). ", em("A importância do sono para a saúde mental. "), "Empresa da Arte."))
            
        } else if (input$referencias_menu  == "Patente" && input$normas_menu == "APA (7th ed.)") {
            list(p("Inventor, A. (Ano). ", em("Título da patente" ), " (Sigla do país. Número da patente). Sigla do país: Órgão patenteador."), 
                 p(strong("Exemplo:"), " Smith, J. (2020). ", em("Dispositivo para medir a pressão arterial" ), " (U.S. N. 12345). U.S. Escritório de Patentes dos EUA."))
            
        } else if (input$referencias_menu  == "Programa de televisão ou rádio" && input$normas_menu == "APA (7th ed.)") {
            list(p("Nome do Produtor (Produtor). (Ano, Mês Dia).", em(" Título do programa" ), "[Tipo de mídia]; Emissora."), 
                 p(strong("Exemplo:"), " Smith, J. (Produtor). (2020, Março 10).", em(" Programa da saúde" ), "[Televisão]; TV Globo."))
            
        } else if (input$referencias_menu  == "Página da web" && input$normas_menu == "APA (7th ed.)") {
            list(p("Autor, A. (Ano, Mês dia).", em("  Título do artigo." ), " Nome da página. URL."), 
                 p(strong("Exemplo:"), " Smith, J. (2020, Julho 15).", em("  Os benefícios do exercício para a saúde mental." ), "Página da Saúde. https://www.saude.com/exercicio-beneficios/"))
            
        } else if (input$referencias_menu  == "Relatório governamental" && input$normas_menu == "APA (7th ed.)") {
            list(p("Órgão governamental. (Ano).", em(" Título do relatório." ), "Editor. URL."), 
                 p(strong("Exemplo:"), " Ministério da Saúde Brasileiro. (2020).", em("  Relatório sobre a saúde mental no Brasil." ), "Brasil. https://www.saude.gov.br/relatorio-saude-mental"))
            
        } else if (input$referencias_menu  == "Tese ou dissertação" && input$normas_menu == "APA (7th ed.)") {
            list(p("Autor. A. (Ano).", em("  Título da tese ou dissertação" ), " [Grau]. Instituição ."), 
                 p(strong("Exemplo:"), " Smith, J. (2020).", em("  A importância do sono para a saúde mental " ), " [Doutorado]. Universidade da Saúde.")) 
            # ABNT (NBR 6023) -----   
        } else if (input$referencias_menu == "Artigo científico em periódico com 1 autor" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR, Nome. Título do artigo. ", strong("Nome do periódico, "), "Local de Publicação, volume, número, página inicial-página final, mês e ano de publicação."),
                 p(strong("Exemplo:"), "SILVA, Maria. A importância da atividade física na prevenção de doenças crônicas.", strong( "Revista de Saúde Pública, "), "São Paulo, v. 46, n. 3, p. 356-365, set. 2012."))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com 2 a 3 autores" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR A, Nome A; AUTOR B, Nome B; AUTOR C, Nome C. Título do artigo. ", strong("Nome do periódico, "), "Local de publicação, volume, número, página inicial-página final, mês e ano de publicação."),
                 p(strong("Exemplo:"), "SILVA, Maria; GARCIA, Ana; GOMES, Antônio. A importância da atividade física na prevenção de doenças crônicas.", strong( "Revista de Saúde Pública, "), "São Paulo, v. 46, n. 3, p. 356-365, set. 2012."))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 4 autores" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR A, Nome A. ", em("et al."), " Título do artigo. ", strong("Nome do periódico, "), "Local de publicação, volume, número, página inicial-página final, mês e ano de publicação."),
                 p(strong("Exemplo:"), "SILVA, M. ", em("et al."), " A importância da atividade física na prevenção de doenças crônicas.", strong( "Revista de Saúde Pública, "), "São Paulo, v. 46, n. 3, p. 356-365, set. 2012."))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 5 autores" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR A, Nome A. ", em("et al."), " Título do artigo. ", strong("Nome do periódico, "), "Local de publicação, volume, número, página inicial-página final, mês e ano de publicação."),
                 p(strong("Exemplo:"), "SILVA, M. ", em("et al."), " A importância da atividade física na prevenção de doenças crônicas.", strong( "Revista de Saúde Pública, "), "São Paulo, v. 46, n. 3, p. 356-365, set. 2012."))      
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 6 autores" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR A, Nome A. ", em("et al."), " Título do artigo. ", strong("Nome do periódico, "), "Local de publicação, volume, número, página inicial-página final, mês e ano de publicação."),
                 p(strong("Exemplo:"), "SILVA, M. ", em("et al."), " A importância da atividade física na prevenção de doenças crônicas.", strong( "Revista de Saúde Pública, "), "São Paulo, v. 46, n. 3, p. 356-365, set. 2012."))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 9 autores" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR A, Nome A. ", em("et al."), " Título do artigo. ", strong("Nome do periódico, "), "Local de publicação, volume, número, página inicial-página final, mês e ano de publicação."),
                 p(strong("Exemplo:"), "SILVA, M. ", em("et al."), " A importância da atividade física na prevenção de doenças crônicas.", strong( "Revista de Saúde Pública, "), "São Paulo, v. 46, n. 3, p. 356-365, set. 2012."))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 10 autores" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR A, Nome A. ", em("et al."), " Título do artigo. ", strong("Nome do periódico, "), "Local de publicação, volume, número, página inicial-página final, mês e ano de publicação."),
                 p(strong("Exemplo:"), "SILVA, M. ", em("et al."), " A importância da atividade física na prevenção de doenças crônicas.", strong( "Revista de Saúde Pública, "), "São Paulo, v. 46, n. 3, p. 356-365, set. 2012."))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 20 autores" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR A, Nome A. ", em("et al."), " Título do artigo. ", strong("Nome do periódico, "), "Local de publicação, volume, número, página inicial-página final, mês e ano de publicação."),
                 p(strong("Exemplo:"), "SILVA, M. ", em("et al."), " A importância da atividade física na prevenção de doenças crônicas.", strong( "Revista de Saúde Pública, "), "São Paulo, v. 46, n. 3, p. 356-365, set. 2012."))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com 21+ autores" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR A, Nome A. ", em("et al."), " Título do artigo. ", strong("Nome do periódico, "), "Local de publicação, volume, número, página inicial-página final, mês e ano de publicação."),
                 p(strong("Exemplo:"), "SILVA, M. ", em("et al."), " A importância da atividade física na prevenção de doenças crônicas.", strong( "Revista de Saúde Pública, "), "São Paulo, v. 46, n. 3, p. 356-365, set. 2012."))
            
        } else if (input$referencias_menu  == "Artigo de enciclopédia ou dicionário" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR, Nome. ", strong("Nome da enciclopédia ou do dicionário. "), "Número da edição. Local de Publicação: Editora, ano de publicação."), 
                 p(strong("Exemplo:"), "SILVA, Maria.", strong("Enciclopédia Brasileira de Saúde. "), "1 ed. Rio de Janeiro: Editora ABC, 2012."))
            
        } else if (input$referencias_menu  == "Artigo de jornal online" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR, Nome. Título da notícia.", strong("Nome do jornal"), ", Local de publicação, volume, número, dia mês e ano da publicação. Disponível em: URL. Acesso em: dia mês e ano de acesso."), 
                 p(strong("Exemplo:"), "SILVA, Maria. A importância da atividade física na prevenção de doenças crônicas.", strong(" Jornal da Saúde"), ", São Paulo, v.5, n.1, 20 mar. 2021. Disponível em: https://www.jornaldasaude.com.br/saude/a-importancia-da-atividade-fisica-na-prevencao-de-doencas-cronicas. Acesso em: 22 mar. 2021."))
            
        } else if (input$referencias_menu  == "Artigo de revista online" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR, Nome. Título do artigo.", strong("Nome da revista"), ", Local de publicação, volume, número, dia mês e ano da publicação. Disponível em: URL. Acesso em: dia mês e ano de acesso."), 
                 p(strong("Exemplo:"), "SILVA, Maria. A importância da atividade física na prevenção de doenças crônicas.", strong(" Revista da Saúde"), ", São Paulo, v.5, n.1, 20 mar. 2021. Disponível em: https://www.revistadasaude.com.br/saude/a-importancia-da-atividade-fisica-na-prevencao-de-doencas-cronicas. Acesso em: 22 mar. 2021."))  
            
        } else if (input$referencias_menu  == "Blog post" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR, Nome. Título do post.", strong("Nome do blog"), ", Local de publicação, dia mês e ano da publicação. Disponível em: URL. Acesso em: dia mês e ano de acesso."), 
                 p(strong("Exemplo:"), "SILVA, Maria. A importância da atividade física na prevenção de doenças crônicas.", strong(" Blog da Saúde"), ", São Paulo, v.5, n.1, 20 mar. 2021. Disponível em: https://www.blogdadasaude.com.br/saude/a-importancia-da-atividade-fisica-na-prevencao-de-doencas-cronicas. Acesso em: 22 mar. 2021."))  
            
        } else if (input$referencias_menu  == "Capítulo de livro" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR, Nome do autor do capítulo. Título do capítulo.", em("In:"), " SOBRENOME, Nome do Autor do livro.", strong(" Título do livro."), "Local de publicação: Editora, ano de publicação, página inicial-página final do capítulo."), 
                 p(strong("Exemplo:"), " SILVA, Maria. A importância da atividade física na prevenção de doenças crônicas.", em("In:"), " SOUZA, João, SILVA, Ana Maria (orgs.). ", strong(" Saúde: aspectos gerais."), " Rio de Janeiro: Editora XYZ, 2020, p. 143-155."))
            
        } else if (input$referencias_menu  == "Tese ou dissertação" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR, Nome. ", strong("Título da dissertação ou tese."), "Tipo de documento (tese ou dissertação), Nome do curso, Instituição, Local, Ano de Apresentação."),
                 p(strong("Exemplo:"), " SILVA, Maria. ", strong(" A importância da atividade física na prevenção de doenças crônicas. "), "Dissertação (Mestrado), Educação Física, Universidade Federal de São Paulo, São Paulo, 2020"))      
            
        } else if (input$referencias_menu  == "Entrevista pessoal" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("ENTREVISTADO, Nome do Entrevistado. Título da entrevista. [Entrevista concedida a] Nome do Entrevistador. ", strong(" Título da Revista/Jornal. "), "Local de publicação, volume, número, página inicial-página final, mês, ano de publicação."), 
                 p(strong("Exemplo:"), " SILVA, Maria. A importância da atividade física na prevenção de doenças crônicas. [Entrevista concedida a] Ana Maria. ", strong(" Revista da Saúde, "), "São Paulo, v. 14, n. 1, p. 14-28, mai. 2022."))
            
        } else if (input$referencias_menu  == "Exposição de arte" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("ARTISTA, Nome do Artista. ", strong("Nome da obra. "), " Ano. Tipo de obra. Local da exposição"), 
                 p(strong("Exemplo:"), " TOLEDO, Amelia. ", strong("Campos de cor."), "2010. 1 escultura variável, tecidos coloridos. Original. Exposta na 29ª Bienal Internacional de Arte de São Paulo."))
            
        } else if (input$referencias_menu  == "Filme ou vídeo" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("NOME do filme. Direção: Nome do Diretor. Produção: Nome do Produtor. Local: Distribuidora do filme, ano. Mídia (tempo min)."), 
                 p(strong("Exemplo:"), " A IMPORTÂNCIA da atividade física. Direção: Maria Silva. Produção: Produção da Saúde. Brasil: Distribuidora da Saúde, 2021. DVD (42 min)."))
            
        } else if (input$referencias_menu  == "Folheto" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR, Nome. ", strong("Nome do folheto. "), "Local de publicação: Editora, ano de publicação."),
                 p(strong("Exemplo:"), "SILVA, Maria", strong("A importância da atividade física. "), "Rio de Janeiro: Ministero da Saúde, 2021."))
            
        } else if (input$referencias_menu  == "Legislação" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("NOME DO ÓRGÃO GOVERNAMENTAL ", "Tipo de documento", strong("Título. "), "Edição. Local da publicação, ano."), 
                 p(strong("Exemplo:"), " RIO GRANDE DO SUL. [Constituição (1989)]. ", strong(" Constituição do Estado do Rio Grande do Sul.  "), " 4. ed. atual. Porto Alegre: Assembléia Legislativa do Estado do Rio Grande do Sul, 1995"))
            
        } else if (input$referencias_menu  == "Livro" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR, Nome.", strong(" Título do livro. "), "Número da edição. Local da publicação: Editora: Nome da Editora, ano."),
                 p(strong("Exemplo:"), " SILVA, Maria.", strong("A importância da atividade física na prevenção de doenças crônicas. "), "3. ed. Rio de Janeiro: Editora XYZ, 2020"))
            
        } else if (input$referencias_menu  == "Mensagem em fórum online" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AITOR, Nome do Autor da mensagem.", strong(" Título da mensagem."), " Dia mês ano. Fórum. Disponível em: URL. Acesso em: dia mês ano."), 
                 p(strong("Exemplo:"), " SILVA, Maria.", strong(" A importância da atividade física na prevenção de doenças crônicas. "), "Fórum de Saúde. Disponível em: https://www.forumdesaude.com.br/a-importancia-da-atividade-fisica-na-prevencao-de-doencas-cronicas. Acesso em: 22 mar. 2021."))
            
        } else if (input$referencias_menu  == "Música ou álbum de música" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("NOME DO ARTISTA. Nome da música. [Local de gravação]: Gravadora, ano. Suporte (duração min)."), 
                 p(strong("Exemplo:"), " JOHN Mayall & The Bluesbreakers and friends: Eric Clapton, Chris Barber, Mick Taylor: 70th birthday concert. [London]: Eagle Rock Entertainment, 2003. 1 disco blu-ray (ca. 159 min)"))
            
        } else if (input$referencias_menu  == "Patente" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR, Nome do Autor da Patente. ", strong("Título da Patente. "), "Depositante: Nome do Depositante. Procurador: Nome do Procurador. Número da Patente. Data de depósito."), 
                 p(strong("Exemplo:"), " BERTAZZOLI, Rodnei", em("et al."), strong( "Eletrodos de difusão gasosa modificados com catalisadores redox, processo e reator eletroquímico de síntese de peróxido de hidrogênio utilizando os mesmos. "), "Depositante: Universidade Estadual de Campinas. Procurador: Maria Cristina Valim Lourenço Gomes. BR n. PI0600460-1A. Depósito: 27 jan. 2006. "))
            
        } else if (input$referencias_menu  == "Página da web" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("AUTOR, Nome do Autor ou ORGANIZAÇÃO. Título do artigo. ", strong("Nome da página. "), "Disponível em: URL. Acesso em: dia mês e ano."), 
                 p(strong("Exemplo:"), " SILVA, Maria. A importância da atividade física na prevenção de doenças crônicas. ", strong( "Página da Saúde"), "Disponível em: https://www.saude.gov.br/a-importancia-da-atividade-fisica-na-prevencao-de-doencas-cronicas. Acessado em: 22 de março de 2021"))
            
        } else if (input$referencias_menu  == "Relatório governamental" && input$normas_menu == "ABNT (NBR 6023)") {
            list(p("NOME DO ÓRGÃO GOVERNAMENTAL. ", strong("Título do relatório. "),  "Local de publicação: Órgão governamental, ano de publicação."), 
                 p(strong("Exemplo:"), " BRASIL. Ministério da Justiça.", strong( "Relatório de atividades. "), "Brasília, DF: Ministério da Justiça, 1993."))
            
            # Vancouver (11th ed.) -----   
        } else if (input$referencias_menu == "Artigo científico em periódico com 1 autor" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A Título do artigo. Título abreviado do periódico. Ano da publicação [citado Ano Mês Dia]; volume (número): página inicial-página final. Disponível em: https://doi.org/xxxxx."), 
                 p(strong("Exemplo:"), " Kanneganti P. The effect of smoking on ligament and cartilage surgery in the knee: a systematic review. Am J Sports Med [Internet]. 2012 Dec [cited 2013 Feb 19];40(12):2872-8. Available from: http://ajs.sagepub.com/content/40/12/2872 DOI: 10.1177/0363546512458223"))     
            
        } else if (input$referencias_menu == "Artigo científico em periódico com 2 a 3 autores" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A, Autor B, Autor C. Título do artigo. Título abreviado do periódico [Internet]. Ano da publicação [citado Ano Mês Dia]; volume (número): página inicial-página final. Disponível em: https://doi.org/xxxxx."), 
                 p(strong("Exemplo:"), " Kanneganti P, Harris JD, Brophy RH. The effect of smoking on ligament and cartilage surgery in the knee: a systematic review. Am J Sports Med [Internet]. 2012 Dec [cited 2013 Feb 19];40(12):2872-8. Available from: http://ajs.sagepub.com/content/40/12/2872 DOI: 10.1177/0363546512458223"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 4 autores" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A, Autor B, Autor C, et al.  Título do artigo. Título abreviado do periódico [Internet]. Ano da publicação [citado Ano Mês Dia]; volume (número): página inicial-página final. Disponível em: https://doi.org/xxxxx."), 
                 p(strong("Exemplo:"), " Kanneganti P, Harris JD, Brophy RH, Carey JL. et al. The effect of smoking on ligament and cartilage surgery in the knee: a systematic review. Am J Sports Med [Internet]. 2012 Dec [cited 2013 Feb 19];40(12):2872-8. Available from: http://ajs.sagepub.com/content/40/12/2872 DOI: 10.1177/0363546512458223"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 5 autores" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A, Autor B, Autor C, et al.  Título do artigo. Título abreviado do periódico [Internet]. Ano da publicação [citado Ano Mês Dia]; volume (número): página inicial-página final. Disponível em: https://doi.org/xxxxx."), 
                 p(strong("Exemplo:"), " Kanneganti P, Harris JD, Brophy RH, Carey JL. et al. The effect of smoking on ligament and cartilage surgery in the knee: a systematic review. Am J Sports Med [Internet]. 2012 Dec [cited 2013 Feb 19];40(12):2872-8. Available from: http://ajs.sagepub.com/content/40/12/2872 DOI: 10.1177/0363546512458223"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 6 autores" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A, Autor B, Autor C, et al.  Título do artigo. Título abreviado do periódico [Internet]. Ano da publicação [citado Ano Mês Dia]; volume (número): página inicial-página final. Disponível em: https://doi.org/xxxxx."), 
                 p(strong("Exemplo:"), " Kanneganti P, Harris JD, Brophy RH, Carey JL. et al. The effect of smoking on ligament and cartilage surgery in the knee: a systematic review. Am J Sports Med [Internet]. 2012 Dec [cited 2013 Feb 19];40(12):2872-8. Available from: http://ajs.sagepub.com/content/40/12/2872 DOI: 10.1177/0363546512458223"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 9 autores" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A, Autor B, Autor C, et al.  Título do artigo. Título abreviado do periódico [Internet]. Ano da publicação [citado Ano Mês Dia]; volume (número): página inicial-página final. Disponível em: https://doi.org/xxxxx."), 
                 p(strong("Exemplo:"), " Kanneganti P, Harris JD, Brophy RH, Carey JL. et al. The effect of smoking on ligament and cartilage surgery in the knee: a systematic review. Am J Sports Med [Internet]. 2012 Dec [cited 2013 Feb 19];40(12):2872-8. Available from: http://ajs.sagepub.com/content/40/12/2872 DOI: 10.1177/0363546512458223"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 10 autores" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A, Autor B, Autor C, et al.  Título do artigo. Título abreviado do periódico [Internet]. Ano da publicação [citado Ano Mês Dia]; volume (número): página inicial-página final. Disponível em: https://doi.org/xxxxx."), 
                 p(strong("Exemplo:"), " Kanneganti P, Harris JD, Brophy RH, Carey JL. et al. The effect of smoking on ligament and cartilage surgery in the knee: a systematic review. Am J Sports Med [Internet]. 2012 Dec [cited 2013 Feb 19];40(12):2872-8. Available from: http://ajs.sagepub.com/content/40/12/2872 DOI: 10.1177/0363546512458223"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 20 autores" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A, Autor B, Autor C, et al.  Título do artigo. Título abreviado do periódico [Internet]. Ano da publicação [citado Ano Mês Dia]; volume (número): página inicial-página final. Disponível em: https://doi.org/xxxxx."), 
                 p(strong("Exemplo:"), " Kanneganti P, Harris JD, Brophy RH, Carey JL. et al. The effect of smoking on ligament and cartilage surgery in the knee: a systematic review. Am J Sports Med [Internet]. 2012 Dec [cited 2013 Feb 19];40(12):2872-8. Available from: http://ajs.sagepub.com/content/40/12/2872 DOI: 10.1177/0363546512458223"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com 21+ autores" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A, Autor B, Autor C, et al. Título abreviado do periódico [Internet]. Ano da publicação [citado Ano Mês Dia]; volume (número): página inicial-página final. Disponível em: https://doi.org/xxxxx."), 
                 p(strong("Exemplo:"), " Kanneganti P, Harris JD, Brophy RH, Carey JL. et al. The effect of smoking on ligament and cartilage surgery in the knee: a systematic review. Am J Sports Med [Internet]. 2012 Dec [cited 2013 Feb 19];40(12):2872-8. Available from: http://ajs.sagepub.com/content/40/12/2872 DOI: 10.1177/0363546512458223"))
            
        } else if (input$referencias_menu  == "Artigo de enciclopédia ou dicionário" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Título da enciclopédia ou dicionário [Internet]. Local de publicação: Editora; ano. Título do artigo; [atualizado em ano Mês dia; citado em ano Mês dia]; [número de páginas]. Disponível em: URL"), 
                 p(strong("Exemplo:"), " A.D.A.M. medical encyclopedia [Internet]. Atlanta (GA): A.D.A.M., Inc.; c2005. Ear barotrauma; [updated 2006 Oct 20; cited 2006 Nov 16]; [about 4 screens]. Available from: http://www.nlm.nih.gov/medlineplus/ency/article/001064.htm"))
            
        } else if (input$referencias_menu  == "Artigo de jornal online" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A. Título do artigo. Nome do jornal [Internet]. Ano Mês dia [citado em Ano Mês dia]. Disponível em: URL. "), 
                 p(strong("Exemplo:"), " Devlin, H. Neuron breakthrough offers hope on Alzheimer’s and Parkinson’s. The Times [Internet]. 2010 Jan 28 [cited 2010 Jan 31]. Available from: http://www.timesonline.co.uk/tol/news/science/medicine/article7005401.ece."))
            
        } else if (input$referencias_menu  == "Artigo de revista online" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A. Título do artigo. Nome da revista [Internet]. Ano Mês dia [citado em Ano Mês dia]. Número: página inicial-página final. Disponível em: URL."), 
                 p(strong("Exemplo:"), " Tidy D. Smoking - The facts. Health [Internet]. 2015 Mar 18 [cited 2015 Apr 5]; 6: 1 p. Available from: http://www.patient.co.uk/Health/smoking-the-facts"))
            
        } else if (input$referencias_menu  == "Blog post" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A. Título do post. Ano Mês dia da publicação. Nome do blog [online]. Ano. [Acessado em dia mês ano]. Disponível em: URL."), 
                 p(strong("Exemplo:"), " Welle K. Impressions from the Stockholm World Water Week. 25 August. ODI blog: commentary from leading development experts [online]. 2006. [Accessed 9 July 2007]. Available from: http://blogs.odi.org.uk/blogs/main/archive/category/1020.aspx"))
            
        } else if (input$referencias_menu  == "Capítulo de livro" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor, A. Título do capítulo. In: Autor, A. do livro. Título do livro. Local de publicação: Editora; ano de publicação; página inicial-página final. "), 
                 p(strong("Exemplo:"), " Haefner H. Negative symptoms and the assessment of neurocognitive treatment response. In: Keefe RSE, McEvoy JP, editors. Negative symptom and cognitive deficit treatment response in schizophrenia. Washington DC: American Psychiatric Association; 2004. p. 85-110."))
            
        } else if (input$referencias_menu  == "Tese ou dissertação" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor, A. Título da tese ou dissertação. Grau. Instituição; ano da publicação. "), 
                 p(strong("Exemplo:"), " Deb S. Psychopathology of adults with a mental handicap and epilepsy. MA thesis, University of Leicester; 1991."))
            
        } else if (input$referencias_menu  == "Entrevista pessoal" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor, A. Título da entrevista. [Entrevista pessoal, dia Mês]. Local da entrevista; ano."), 
                 p(strong("Exemplo:"), " Thapisa A. Co-operation with the University of Botswana. [Personal interview, 10 Mar] Cape Town; 1998."))
            
        } else if (input$referencias_menu  == "Exposição de arte" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Artista, A.", em("Título da obra"), "(Cidade da exibição: nome do local de exibição, ano)"), 
                 p(strong("Exemplo:"), " Caroline Mathieu, Monique Nonne and Ted Gott, ", em("The Impressionists: Masterpieces from the Musee D'Orsay "), "(Melbourne: National Gallery of Victoria, 2004)"))
            
        } else if (input$referencias_menu  == "Filme ou vídeo" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p(em("Título do filme "), "ou vídeo [formato]. Dirigido por: Nome do diretor. País do filme: Produtora; ano. "), 
                 p(strong("Exemplo:"), em(" Awakenings "), "[Film] Directed by: Penny Marshall. USA: Lasker/Parkes Productions; 1990."))
            
        } else if (input$referencias_menu  == "Folheto" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor, A. Título do folheto [folheto]. Local da publicação: Editor; ano."), 
                 p(strong("Exemplo:"), " Pharmaceutical Society of Australia. Medicines and driving [pamphlet]. Sydney (AU): Pharmaceutical Society of Australia; 1998."))
            
        } else if (input$referencias_menu  == "Legislação" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Título da lei, tipo [Internet], ano Mês dia [citado ano Mês dia] (País). Disponível em: URL."), 
                 p(strong("Exemplo:"), " Health Act 2009 [Internet], 2009 Jan 21 [cited 2021 Jun 29] (Great Britain). Available from: https://www.legislation.gov.uk/ukpga/2009/21/contents"))
            
        } else if (input$referencias_menu  == "Livro" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Author A. Título do livro. Número da edição. Local de publicação: Editora; Ano de publicação. Total de páginas."), 
                 p(strong("Exemplo:"), " Carlson BM. Human embryology and developmental biology. 4th ed. St. Louis: Mosby; 2009. 541 p."))
            
        } else if (input$referencias_menu  == "Mensagem em fórum online" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor, A. Título da mensagem. In: Nome do fórum [Internet]. Local de publicação: Editora;  ano mês dia da publicação [Citado em ano mês dia]. [Extensão]."), 
                 p(strong("Exemplo:"), " Rodin P. How cats hunt. In: Cat health [Internet]: Veterinary Library Association; 2007 Apr 27 [cited 2008 May 28]. [13 lines]."))
            
        } else if (input$referencias_menu  == "Música ou álbum de música" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Artista A, Nome da música [Mídia]. Álbum [citado ano Mês dia]. Disponível em: URL."), 
                 p(strong("Exemplo:"), " The Beatles. Here Comes the Sun [Internet]. Abbey Road. 1969 [cited 2023Jan.17]. Available from: https://itunes.apple.com/us/album/here-comes-the-sun/401186200?i=401187150"))
            
        } else if (input$referencias_menu  == "Obra de teatro" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A. ", em("Título da peça. "), "ed. por Nome do editor, Edição (Local de publicação, Editor, ano)."), 
                 p(strong("Exemplo:"), " Shakespeare, William, ", em("Hamlet "), "ed. by Cyrus Hoy, A Norton Critical Edition, 2nd ed. (New York: Norton, 1992)."))
            
        } else if (input$referencias_menu  == "Patente" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A. ", em("Nome da patente. "), "Número da patente (Patente) Ano."), 
                 p(strong("Exemplo:"), " Smith J, Ronaldo P, Ferry B. ", em("Plug-in 'cite-o-matic' citation and reference generation device for students. "), "US6324558B1 (Patent) 2010."))
            
        } else if (input$referencias_menu  == "Programa de televisão ou rádio" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Título do episódio. ", em("Título do programa. "), "Transmissora. Mês dia, ano de gravação. "), 
                 p(strong("Exemplo:"), " Two Hundred. ", em("Chicago Fire. "), "NBC. October 20, 2021."))
            
        } else if (input$referencias_menu  == "Página da web" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor/organização. Título da página [Internet]. Local de publicação: Editor; Ano de publicação [atualizado em ano mês dia; citado em ano mês dia]. Disponível em: URL."), 
                 p(strong("Exemplo:"), " Diabetes Australia. Diabetes globally [Internet]. Canberra ACT: Diabetes Australia; 2012 [updated 2012 June 15; cited 2012 Nov 5]. Available from: http://www.diabetesaustralia.com.au/en/ Understanding-Diabetes/DiabetesGlobally/"))
            
        } else if (input$referencias_menu  == "Relatório governamental" && input$normas_menu == "Vancouver (11th ed.)") {
            list(p("Autor A. Título do Relatório. Local de publicação: Editora; Ano de publicação. Número total de páginas. Número do relatório: X."), 
                 p(strong("Exemplo:"), " Rowe IL, Carson NE. Medical manpower in Victoria. East Bentleigh (AU): Monash University, Department of Community Practice; 1981. 35 p. Report No.: 4."))
            
            # Chicago (17th ed.) -----   
        } else if (input$referencias_menu == "Artigo científico em periódico com 1 autor" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome, Nome. 'Título do artigo.'", em("Nome do jornal "), "volume, número (Mês ano): página inicial-página final. https://doi.org/xxxxx"), 
                 p(strong("Exemplo:"), " Smith, John. 'Os benefícios do exercício regular para a saúde mental.'", em("Jornal da Saúde, "), "25, 2 (Outubro 2020): 12-15. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com 2 a 3 autores" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome A, Nome A, Sobrenome B Nome B, e Sobrenome C Nome C. 'Título do artigo.'", em("Nome do jornal "), "volume, número (Mês ano): página inicial-página final. https://doi.org/xxxxx"), 
                 p(strong("Exemplo:"), " Smith, John, Johnson Kyle, e Williams Michael. 'Os benefícios do exercício regular para a saúde mental.'", em("Jornal da Saúde, "), "25, 2 (Outubro 2020): 12-15. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 4 autores" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome A, Nome A, Sobrenome B Nome B, Sobrenome C Nome C, e Sobrenome D Nome D. 'Título do artigo.'", em("Nome do jornal "), "volume, número (Mês ano): página inicial-página final. https://doi.org/xxxxx"), 
                 p(strong("Exemplo:"), " Smith, John, Johnson Kyle, Williams Michael, e Labrie James. 'Os benefícios do exercício regular para a saúde mental.'", em("Jornal da Saúde, "), "25, 2 (Outubro 2020): 12-15. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 5 autores" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome A, Nome A, Sobrenome B Nome B, Sobrenome C Nome C, Sobrenome D Nome D, e Sobrenome E Nome E. 'Título do artigo.'", em("Nome do jornal "), "volume, número (Mês ano): página inicial-página final. https://doi.org/xxxxx"), 
                 p(strong("Exemplo:"), " Smith, John, Johnson Kyle, Williams Michael, Labrie James, e Portnoy Mike. 'Os benefícios do exercício regular para a saúde mental.'", em("Jornal da Saúde, "), "25, 2 (Outubro 2020): 12-15. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 6 autores" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome A, Nome A, Sobrenome B Nome B, Sobrenome C Nome C, Sobrenome D Nome D, Sobrenome E Nome E, e Sobrenome F Nome F. 'Título do artigo.'", em("Nome do jornal "), "volume, número (Mês ano): página inicial-página final. https://doi.org/xxxxx"), 
                 p(strong("Exemplo:"), " Smith, John, Johnson Kyle, Williams Michael, Labrie James, Petrucci, John, e Portnoy Mike. 'Os benefícios do exercício regular para a saúde mental.'", em("Jornal da Saúde, "), "25, 2 (Outubro 2020): 12-15. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 9 autores" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome A, Nome A, Sobrenome B Nome B, Sobrenome C Nome C, Sobrenome D Nome D, Sobrenome E Nome E, Sobrenome F Nome F, Sobrenome G Nome G, Sobrenome H Nome H, e Sobrenome I Nome I. 'Título do artigo.'", em("Nome do jornal "), "volume, número (Mês ano): página inicial-página final. https://doi.org/xxxxx"), 
                 p(strong("Exemplo:"), " Smith, John, Johnson Kyle, Williams Michael, Labrie James, Petrucci John, Moore Kevin, Rudess Jordan, Mangini Mike, e Portnoy Mike. 'Os benefícios do exercício regular para a saúde mental.'", em("Jornal da Saúde, "), "25, 2 (Outubro 2020): 12-15. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 10 autores" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome A, Nome A, Sobrenome B Nome B, Sobrenome C Nome C, Sobrenome D Nome D, Sobrenome E Nome E, Sobrenome F Nome F, Sobrenome G Nome G, Sobrenome H Nome H, e Sobrenome I Nome I, e Sobrenome J Nome J. 'Título do artigo.'", em("Nome do jornal "), "volume, número (Mês ano): página inicial-página final. https://doi.org/xxxxx"), 
                 p(strong("Exemplo:"), " Smith, John, Johnson Kyle, Williams Michael, Labrie James, Petrucci John, Moore Kevin, Rudess Jordan, Mangini Mike, Dickinson Bruce, e Portnoy Mike. 'Os benefícios do exercício regular para a saúde mental.'", em("Jornal da Saúde, "), "25, 2 (Outubro 2020): 12-15. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com até 20 autores" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome A, Nome A, Sobrenome B Nome B, Sobrenome C Nome C, Sobrenome D Nome D, Sobrenome E Nome E, Sobrenome F Nome F, Sobrenome G et al. 'Título do artigo.'", em("Nome do jornal "), "volume, número (Mês ano): página inicial-página final. https://doi.org/xxxxx"), 
                 p(strong("Exemplo:"), " Smith, John, Johnson Kyle, Williams Michael, Labrie James, Petrucci John, Moore Kevin, Rudess Jordan et al. 'Os benefícios do exercício regular para a saúde mental.'", em("Jornal da Saúde, "), "25, 2 (Outubro 2020): 12-15. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu == "Artigo científico em periódico com 21+ autores" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome A, Nome A, Sobrenome B Nome B, Sobrenome C Nome C, Sobrenome D Nome D, Sobrenome E Nome E, Sobrenome F Nome F, Sobrenome G et al. 'Título do artigo.'", em("Nome do jornal "), "volume, número (Mês ano): página inicial-página final. https://doi.org/xxxxx"), 
                 p(strong("Exemplo:"), " Smith, John, Johnson Kyle, Williams Michael, Labrie James, Petrucci John, Moore Kevin, Rudess Jordan et al. 'Os benefícios do exercício regular para a saúde mental.'", em("Jornal da Saúde, "), "25, 2 (Outubro 2020): 12-15. https://doi.org/abc12345"))
            
        } else if (input$referencias_menu  == "Artigo de enciclopédia ou dicionário" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome, Nome. ",  em("Nome da enciclopédia ou dicionário. "), "Edição. Local de publicação: Editora, ano."), 
                 p(strong("Exemplo:"), " Smith, John. ",  em("Dicionário de Saúde. "), "Ed. 4. Rio de Janeiro: Editora da Saúde, 2019."))
            
        } else if (input$referencias_menu  == "Artigo de jornal online" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome, Nome. Ano. 'Título do artigo.'", em("Nome do jornal. "), "Mês Dia, Ano de acesso. URL."), 
                 p(strong("Exemplo:"), " Smith, John. 2020. 'Os benefícios do exercício regular para a saúde mental'", em("Jornal da Saúde. "), "Janeiro 11, 2021. https://www.jornaldasaude.com/exercicio-e-saude-mental."))
            
        } else if (input$referencias_menu  == "Artigo de revista online" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome, Nome. 'Título do artigo.'", em("Nome da revista. "), "Mês Dia, Ano da publicação, página da citação URL."), 
                 p(strong("Exemplo:"), " Smith, John. 'Os benefícios do exercício regular para a saúde mental'", em("Revista da Saúde. "), "Janeiro 11, 2021, 18, https://www.jornaldasaude.com/exercicio-e-saude-mental."))
            
        } else if (input$referencias_menu  == "Blog post" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome, Nome. Ano. 'Título do post'.", em("Nome do blog,"), "Mês Dia, Ano de acesso. URL."), 
                 p(strong("Exemplo:"), " Smith, John. 2020. 'Os benefícios do exercício regular para a saúde mental'.", em("Blog da Saúde,"), "15, Maio, 2021. https://www.blogdasaude.com/exercicio-e-saude-mental."))
            
        } else if (input$referencias_menu  == "Capítulo de livro" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome, Nome. Ano. 'Título do capítulo.' In", em("Título do livro"), "Editor., página inicial-página final. Local de publicação: Editora"), 
                 p(strong("Exemplo:"), " Smith, John. 2020. 'Os benefícios do exercício para a saúde mental. ' In", em("Guia de saúde mental"), " editado por Kevin Johnson, 45-50. Londres: Editora da Saúde."))
            
        } else if (input$referencias_menu  == "Tese ou dissertação" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome, Nome. 'Título da tese ou dissertação'. Grau. Instituição . URL"), 
                 p(strong("Exemplo:"), " Smith, John. 2020. 'A importância do sono para a saúde mental.' Tese de doutorado. Universidade da Saúde. https://www.usteses.com/sono-saude-mental.")) 
            
        } else if (input$referencias_menu  == "Entrevista pessoal" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome, Nome. 'Título da Entrevista' por Entrevistador, A", em("Nome do jornal/revista onde foi publicado "), "volume, número (Ano): página inicial-página final."),
                 p(strong("Exemplo:"), " Bellour, Raymond. 'Alternation, Segmentation, Hypnosis: Interview with Raymond Bellour.' By Janet Bergstrom.", em("Camera Obscura, "), "nos. 3–4 (Summer 1979): 89–94.")) 
            
        } else if (input$referencias_menu  == "Exposição de arte" && input$normas_menu == "Chicago (17th ed.)") {
            list(p(" Sobrenome, Nome. ", em("Título da obra. "), "Local: Museu onde foi apresentado, Ano de publicação"), 
                 p(strong("Exemplo:"), " Cristosomo, Christian D., ed. ",em("Marvels and Myths: Examinations of Gods."), "Chicago: Museum of Comics and Culture, 2021."))
            
        } else if (input$referencias_menu  == "Filme ou vídeo" && input$normas_menu == "Chicago (17th ed.)") {
            list(p(" Sobrenome, Nome, diretor. " , em("Título do filme. "), "Produtora, Ano. Duração do filme. URL"), 
                 p(strong("Exemplo:"), " Weir, Peter, director.", em("The Truman Show. "), "Paramount Pictures, 1998. 1 hr., 43 min. https://www.netflix.com/watch/11819086."))
            
        } else if (input$referencias_menu  == "Folheto" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome, Nome. ", em("Título do folheto. "), "(Local de publicação: Editora, Ano)"), 
                 p(strong("Exemplo:"), " Audrey Briers", em("Eat, Drink and Be Merry. "), "(Oxford: Ashmolean Museum, 1990)"))
            
        } else if (input$referencias_menu  == "Legislação" && input$normas_menu == "Chicago (17th ed.)") {
            list(p(em("Título Ano" ), "(Jurisdição). URL"), 
                 p(em("Domicile Act 1982 "), " (Cth). https://www.legislation.gov.au/Series/C2004A02560"))
            
        } else if (input$referencias_menu  == "Livro" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome Nome. Ano. ", em("Título do livro. "), "Edição. Local de publicação: Nome da editora."), 
                 p(strong("Exemplo:"), "Smith John. 2018. ", em("The History of Medicine. "), " 2nd ed. New York: Oxford University Press."))
            
        } else if (input$referencias_menu  == "Mensagem em fórum online" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Autor Nome, postado em 'Nome do fórum'. Mês dia, Ano publicação, URL."), 
                 p(strong("Exemplo:"), " Catherine Morland, post to 'HTML/CSS - Books n Blogs' The Web Design Forum, Julho 12, 2019, https://thewebdesignforum.co.uk/topic/4553-htmlcss-books-n-blogs/?p=40893."))
            
        } else if (input$referencias_menu  == "Música ou álbum de música" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Nome do artista. Ano de gravação. 'If You Leave Me Now. '", em("Nome do álbum. "),"Gravadora, mídia."), 
                 p(strong("Exemplo:"), " Chicago. 2017. 'If You Leave Me Now' Track 9 on", em("Chicago X. "), "Columbia, compact disc."))
            
        } else if (input$referencias_menu  == "Obra de teatro" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome, Nome, 'Nome da peça. ' In ", em('Revista em que foi publicada. '), "Editada por Editor A. Local da publicação: Editor, ano da publicação."), 
                 p(strong("Exemplo:"), " Miranda, Lin-Manuel. 'Hamilton: An American Musical. ' In", em("Hamilton: The Revolution. "), "Edited by Jeremy McCarter. New York: Grand Central Publishing, 2016."))
            
        } else if (input$referencias_menu  == "Patente" && input$normas_menu == "Chicago (17th ed.)") {
            list(p(" Sobrenome, Nome. Ano. Nome da patente. País da patente. Número da patente, arquivado mês, ano, publicado mês, ano."), 
                 p(strong("Exemplo:"), " Iizuka, Masanori, and Hideki Tanaka. 1986. Cement admixture. US Patent 4,586,960, filed June 26, 1984, and issued May 6, 1986."))
            
        } else if (input$referencias_menu  == "Programa de televisão ou rádio" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Nome do programa, 'Título do Episódio, '", em("Nome da transmissora, "), "duração, dia de transmissão, URL."), 
                 p(strong("Exemplo:"), " Once Upon A Time, 'Second Star to the Right, '", em("Hulu"), "video, 43:04, May 5, 2013,  http://www.hulu.com/watch/486422."))
            
        } else if (input$referencias_menu  == "Página da web" && input$normas_menu == "Chicago (17th ed.)") {
            list(p("Sobrenome Nome. 'Título do artigo'.", em("Nome do site. "), "URL. Mês dia, ano de acesso. URL"), 
                 p(strong("Exemplo:"), " Smith John. 'How to cite a web page in Chicago style'.", em("Medical Resources."), "Acessado em Abril 1, 2018. http://www.medicalresources.com/citation-web-page.html"))
            
        } else {
            "Referência não disponível."
        }
    }); 
}

# Execute o aplicativo Shiny
shinyApp(ui, server)

