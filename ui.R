# UI for stanpumpR
# padding top right bottom left

# UI ------------------------------------------------------
function(request) {
  dashboardPage(
    dashboardHeader(
      title = "stanpumpR"
      # Dropdown menu for messages
    ),
    dashboardSidebar(
      collapsed = FALSE,
      width = "200px",
      sidebarMenu(
        id = "tab",
        menuItem("Examples", tabName = "Examples", selected = TRUE),
        menuItem("Help", tabName = "Help", selected = FALSE),
        tags$div(
          style = "padding: 10px 0px 0px 20px; font-size: 14px",
          tags$a(
          "Source Code",
          href="https://github.com/StevenLShafer/stanpumpR",
          target="_blank"
          )
        )
      )
    ),

    dashboardBody(
      useShinyjs(),
      extendShinyjs(
        script = "shinyjs-funcs.js",
        functions = c("scrollLogger")
      ),
      tags$head(tags$link(href = "app.css", rel = "stylesheet")),
  #    style = "max-height: 95vh; overflow-y: auto;" ,
      tags$style(
        HTML(
          '.form-first-row {
          height: 100px;
      }
        .cancel-margin > .form-group {
        margin: 0;
        }
        '
        )
      ), # End of tags$style
      tabItems(
        tabItem(
          tabName = "Examples",
          h2("Examples"),
          fluidRow(
            tabsetPanel(
              id = "tabId",

              ################################################################################################
              tabPanel( # Some representative cases
                title = div(
                  style="text-align:center;",
                  HTML(
                    paste("Representative", "Cases", sep = "<br/>")
                  )
                ),
                value = "Representative",
                tags$head(  #### Is this needed?
                  tags$style(
                    HTML(
                      '.nav-tabs>li>a {
                        margin-right: 4px;
                        border: 1px solid white;
                        border-radius: 10px 10px 0 0;
                        padding-top: 4px;
                        padding-bottom: 4px;
                        padding-left: 6px;
                        padding-right: 6px;
                        }'
                    ) # end HTML
                  ) # end tags$style
                ), # end tags$head
                fluidRow(
                  tags$p(
                    style = "padding: 40px; font-size: 16px",
                    'Representative examples of stanpumpR simulations.'
                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "Default example (propofol, fentanyl, remifentanil, rocuronium)",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=null&age=50&ageUnit=%221%22&caption=%22%22&client_time=%2211%3A13%3A36%20AM%22&cyp2d6=%22typical%22&effectsiteLinetype=%22solid%22&height=66&heightUnit=%222.56%22&logY=false&maximum=%2260%22&normalization=%22none%22&plasmaLinetype=%22blank%22&pregnant=%22FALSE%22&referenceTime=%2210%3A00%22&Refresh=0&renal=%22normal%22&sex=%22female%22&title=%22Simulation%20on%202019-11-01%2018%3A13%3A35%22&typical=%22Range%22&weight=60&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22propofol%22%2C%22fentanyl%22%2C%22remifentanil%22%2C%22rocuronium%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%220%22%2C%220%22%2C%220%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%5D%2C%22Dose%22%3A%5B%220%22%2C%220%22%2C%220%22%2C%220%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mg%22%2C%22mcg%22%2C%22mcg%2Fkg%2Fmin%22%2C%22mg%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B%5D%2C%22Event%22%3A%5B%5D%2C%22Fill%22%3A%5B%5D%7D",
                      target="_blank"
                    )
                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "MEAC for a combination of fentanyl, remifentanil, methadone",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=%22MEAC%22&age=50&ageUnit=%221%22&caption=%22%22&client_time=%2212%3A30%3A18%20PM%22&cyp2d6=%22typical%22&effectsiteLinetype=%22solid%22&height=66&heightUnit=%222.56%22&logY=false&maximum=%2260%22&normalization=%22none%22&plasmaLinetype=%22blank%22&pregnant=%22FALSE%22&referenceTime=%2210%3A00%22&Refresh=1&renal=%22normal%22&sex=%22female%22&shinyjs-delay-5e90c9616e3461ed289005eff120853c=0&title=%22Example%20of%20MEAC%22&typical=%22Range%22&weight=60&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22fentanyl%22%2C%22remifentanil%22%2C%22methadone%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%220%22%2C%220%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%5D%2C%22Dose%22%3A%5B%22100%22%2C%22.1%22%2C%2210%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mcg%22%2C%22mcg%2Fkg%2Fmin%22%2C%22mg%22%2C%22%22%2C%22%22%2C%22%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B%5D%2C%22Event%22%3A%5B%5D%2C%22Fill%22%3A%5B%5D%7D",
                      target="_blank"
                    )
                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "Rocuronium bolus and infusion",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=null&age=50&ageUnit=%221%22&caption=%22%22&client_time=%2211%3A13%3A36%20AM%22&cyp2d6=%22typical%22&effectsiteLinetype=%22solid%22&height=66&heightUnit=%222.56%22&logY=false&maximum=%2260%22&normalization=%22none%22&plasmaLinetype=%22blank%22&pregnant=%22FALSE%22&referenceTime=%2210%3A00%22&Refresh=0&renal=%22normal%22&sex=%22female%22&shinyjs-delay-19fa34c2aba36d6a18a0e56dfea7dfd3=0&title=%22Example%20of%20rocuronium%20infusion%22&typical=%22Range%22&weight=60&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22rocuronium%22%2C%22rocuronium%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%220%22%2C%22%22%5D%2C%22Dose%22%3A%5B%2250%22%2C%221%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mg%22%2C%22mg%2Fkg%2Fhr%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B%5D%2C%22Event%22%3A%5B%5D%2C%22Fill%22%3A%5B%5D%7D",
                      target="_blank"
                    )
                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "Time to emergence",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=%22Time%20to%20Emergence%22&age=50&ageUnit=%221%22&caption=%22%22&client_time=%221%3A08%3A57%20PM%22&cyp2d6=%22typical%22&effectsiteLinetype=%22solid%22&height=66&heightUnit=%222.56%22&logY=false&maximum=%2260%22&normalization=%22none%22&plasmaLinetype=%22blank%22&pregnant=%22FALSE%22&referenceTime=%2210%3A00%22&Refresh=0&renal=%22normal%22&sex=%22female%22&shinyjs-delay-56265752d8d23a1af7b9243464a866a0=0&title=%22Simulation%20on%202019-11-01%2018%3A13%3A35%22&typical=%22Range%22&weight=60&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22propofol%22%2C%22fentanyl%22%2C%22remifentanil%22%2C%22rocuronium%22%2C%22propofol%22%2C%22rocuronium%22%2C%22rocuronium%22%2C%22rocuronium%22%2C%22%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%220%22%2C%220%22%2C%220%22%2C%2210%22%2C%2220%22%2C%2240%22%2C%2260%22%2C%22%22%2C%22%22%5D%2C%22Dose%22%3A%5B%22150%22%2C%22100%22%2C%22.1%22%2C%2250%22%2C%22125%22%2C%2220%22%2C%2220%22%2C%2220%22%2C%22%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mg%22%2C%22mcg%22%2C%22mcg%2Fkg%2Fmin%22%2C%22mg%22%2C%22mcg%2Fkg%2Fmin%22%2C%22mg%22%2C%22mg%22%2C%22mg%22%2C%22%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B%5D%2C%22Event%22%3A%5B%5D%2C%22Fill%22%3A%5B%5D%7D",
                      target="_blank"
                    )
                  )


                ) # end fluid row
              ), # end tabPanel for BJA Dexmedetomidine


              ################################################################################################
              tabPanel( # BJA Dexmedetomidine
                title = div(
                  style="text-align:center;",
                  HTML(
                    paste("Dexmedetomidine", "BJA 2020", sep = "<br/>")
                  )
                ),
                value = "BJA_Dexmedetomidine",
                tags$head(  #### Is this needed?
                  tags$style(
                    HTML(
                      '.nav-tabs>li>a {
                margin-right: 4px;
                border: 1px solid white;
                border-radius: 10px 10px 0 0;
                padding-top: 4px;
                padding-bottom: 4px;
                padding-left: 6px;
                padding-right: 6px;
                }'
                    ) # end HTML
                  ) # end tags$style
                ), # end tags$head
                fluidRow(
                  tags$p(
                    style = "padding: 40px; font-size: 16px",
                    'The examples below illustrate the pharmacokinetics of dexmedetomidine as described in',
                    tags$i(
                      "Results of a Phase I Multicentre Investigation of
                      Dexmedetomidine Bolus and Infusion in Corrective Infant
                      Cardiac Surgery"),
                    'by Zuppa and colleagues (BJA 2020). The are described in greater detail in ',
                    'the accompanying editorial',
                    tags$i(
                      "Let's Play with Dex PK!"
                    ),
                    'by SL Shafer.'

                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "2 week-old girl of 3.8 kg and 52 inches, target = 0.2 ng/ml",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=%22Events%22&age=0.5&ageUnit=%220.08333333%22&caption=%22Girl%2C%200.5%20months%2C%203.8%20kg%2C%2052%20cm%22&client_time=%222%3A48%3A50%20PM%22&effectsiteLinetype=%22solid%22&height=52&heightUnit=%221%22&logY=false&maximum=%22360%22&normalization=%22none%22&plasmaLinetype=%22blank%22&referenceTime=%22none%22&sex=%22female%22&title=%22Neonate%2C%20Target%20%3D%200.2%20ng%2Fml%22&typical=%22Range%22&weight=3.8&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%220%22%2C%2260%22%2C%22120%22%2C%22180%22%2C%22240%22%2C%22360%22%2C%22%22%5D%2C%22Dose%22%3A%5B%220.24%22%2C%220.22%22%2C%221.28%22%2C%220.04%22%2C%220%22%2C%220.14%22%2C%220%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mcg%2Fkg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B0%2C60%2C180%2C360%5D%2C%22Event%22%3A%5B%22Start%22%2C%22CPB%20Start%22%2C%22CPB%20End%22%2C%22End%22%5D%2C%22Fill%22%3A%5B%22blue%22%2C%22red%22%2C%22brown%22%2C%22blue%22%5D%7D",
                      target="_blank"
                    )
                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "2 week-old girl of 3.8 kg and 52 inches, target = 0.5 ng/ml",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=%22Events%22&age=0.5&ageUnit=%220.08333333%22&caption=%22Girl%2C%200.5%20months%2C%203.8%20kg%2C%2052%20cm%22&client_time=%222%3A48%3A19%20PM%22&effectsiteLinetype=%22solid%22&height=52&heightUnit=%221%22&logY=false&maximum=%22360%22&normalization=%22none%22&plasmaLinetype=%22blank%22&referenceTime=%22none%22&sex=%22female%22&title=%22Neonate%2C%20Target%20%3D%200.5%20ng%2Fml%22&typical=%22Range%22&weight=3.8&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%220%22%2C%2260%22%2C%22120%22%2C%22180%22%2C%22240%22%2C%22360%22%2C%22%22%5D%2C%22Dose%22%3A%5B%220.60%22%2C%220.55%22%2C%223.20%22%2C%220.10%22%2C%220%22%2C%220.35%22%2C%220%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mcg%2Fkg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B0%2C60%2C180%2C360%5D%2C%22Event%22%3A%5B%22Start%22%2C%22CPB%20Start%22%2C%22CPB%20End%22%2C%22End%22%5D%2C%22Fill%22%3A%5B%22blue%22%2C%22red%22%2C%22brown%22%2C%22blue%22%5D%7D",
                      target="_blank"
                    )
                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "2 week-old girl of 3.8 kg and 52 inches, target = 0.7 ng/ml",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=%22Events%22&age=0.5&ageUnit=%220.08333333%22&caption=%22Girl%2C%200.5%20months%2C%203.8%20kg%2C%2052%20cm%22&client_time=%229%3A17%3A07%20AM%22&effectsiteLinetype=%22solid%22&height=52&heightUnit=%221%22&logY=false&maximum=%22360%22&normalization=%22none%22&plasmaLinetype=%22blank%22&referenceTime=%22none%22&sex=%22female%22&title=%22Neonate%2C%20Target%20%3D%200.7%20ng%2Fml%22&typical=%22Range%22&weight=3.8&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%220%22%2C%2260%22%2C%22120%22%2C%22180%22%2C%22240%22%2C%22360%22%2C%22%22%5D%2C%22Dose%22%3A%5B%220.84%22%2C%220.77%22%2C%224.48%22%2C%220.14%22%2C%220%22%2C%220.49%22%2C%220%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mcg%2Fkg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B0%2C60%2C180%2C360%5D%2C%22Event%22%3A%5B%22Start%22%2C%22CPB%20Start%22%2C%22CPB%20End%22%2C%22End%22%5D%2C%22Fill%22%3A%5B%22blue%22%2C%22red%22%2C%22brown%22%2C%22blue%22%5D%7D",
                      target="_blank"
                    )
                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "2 week-old girl of 3.8 kg and 52 inches, target = 1.0 ng/ml",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=%22Events%22&age=0.5&ageUnit=%220.08333333%22&caption=%22Girl%2C%200.5%20months%2C%203.8%20kg%2C%2052%20cm%22&client_time=%2210%3A43%3A56%20AM%22&effectsiteLinetype=%22solid%22&height=52&heightUnit=%221%22&logY=false&maximum=%22360%22&normalization=%22none%22&plasmaLinetype=%22blank%22&referenceTime=%22none%22&sex=%22female%22&title=%22Neonate%2C%20Target%20%3D%201.0%20ng%2Fml%22&typical=%22Range%22&weight=3.8&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%220%22%2C%2260%22%2C%22120%22%2C%22180%22%2C%22240%22%2C%22360%22%2C%22%22%5D%2C%22Dose%22%3A%5B%221.20%22%2C%221.10%22%2C%226.40%22%2C%220.20%22%2C%220%22%2C%220.7%22%2C%220%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mcg%2Fkg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B0%2C60%2C180%2C360%5D%2C%22Event%22%3A%5B%22Start%22%2C%22CPB%20Start%22%2C%22CPB%20End%22%2C%22End%22%5D%2C%22Fill%22%3A%5B%22blue%22%2C%22red%22%2C%22brown%22%2C%22blue%22%5D%7D",
                      target="_blank"
                    )
                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "2.5 month-old girl, 5.2 kg, 58 inches, target = 0.2 ng/ml",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=%22Events%22&age=2.5&ageUnit=%220.08333333%22&caption=%22Girl%2C%202.5%20months%2C%205.2%20kg%2C%2058%20cm%22&client_time=%222%3A31%3A16%20PM%22&effectsiteLinetype=%22solid%22&height=58&heightUnit=%221%22&logY=false&maximum=%22360%22&normalization=%22none%22&plasmaLinetype=%22blank%22&referenceTime=%22none%22&sex=%22female%22&title=%22Infant%2C%20Target%20%3D%200.2%20ng%2Fml%22&typical=%22Range%22&weight=5.2&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%220%22%2C%2260%22%2C%22120%22%2C%22180%22%2C%22240%22%2C%22360%22%2C%22%22%5D%2C%22Dose%22%3A%5B%220.29%22%2C%220.26%22%2C%221.60%22%2C%220.05%22%2C%220%22%2C%220.17%22%2C%220%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mcg%2Fkg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B0%2C60%2C180%2C360%5D%2C%22Event%22%3A%5B%22Start%22%2C%22CPB%20Start%22%2C%22CPB%20End%22%2C%22End%22%5D%2C%22Fill%22%3A%5B%22blue%22%2C%22red%22%2C%22brown%22%2C%22blue%22%5D%7D",
                      target="_blank"
                    )
                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "2.5 month-old girl, 5.2 kg, 58 inches, target = 0.5 ng/ml",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=%22Events%22&age=2.5&ageUnit=%220.08333333%22&caption=%22Girl%2C%202.5%20months%2C%205.2%20kg%2C%2058%20cm%22&client_time=%222%3A40%3A03%20PM%22&effectsiteLinetype=%22solid%22&height=58&heightUnit=%221%22&logY=false&maximum=%22360%22&normalization=%22none%22&plasmaLinetype=%22blank%22&referenceTime=%22none%22&sex=%22female%22&title=%22Infant%2C%20Target%20%3D%200.5%20ng%2Fml%22&typical=%22Range%22&weight=5.2&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%220%22%2C%2260%22%2C%22120%22%2C%22180%22%2C%22240%22%2C%22360%22%2C%22%22%5D%2C%22Dose%22%3A%5B%220.72%22%2C%220.66%22%2C%223.84%22%2C%220.12%22%2C%220%22%2C%220.42%22%2C%220%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mcg%2Fkg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B0%2C60%2C180%2C360%5D%2C%22Event%22%3A%5B%22Start%22%2C%22CPB%20Start%22%2C%22CPB%20End%22%2C%22End%22%5D%2C%22Fill%22%3A%5B%22blue%22%2C%22red%22%2C%22brown%22%2C%22blue%22%5D%7D",
                      target="_blank"
                    )
                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "2.5 month-old girl, 5.2 kg, 58 inches, target = 0.7 ng/ml",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=%22Events%22&age=2.5&ageUnit=%220.08333333%22&caption=%22Girl%2C%202.5%20months%2C%205.2%20kg%2C%2058%20cm%22&client_time=%222%3A34%3A13%20PM%22&effectsiteLinetype=%22solid%22&height=58&heightUnit=%221%22&logY=false&maximum=%22360%22&normalization=%22none%22&plasmaLinetype=%22blank%22&referenceTime=%22none%22&sex=%22female%22&title=%22Infant%2C%20Target%20%3D%200.7%20ng%2Fml%22&typical=%22Range%22&weight=5.2&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%220%22%2C%2260%22%2C%22120%22%2C%22180%22%2C%22240%22%2C%22360%22%2C%22%22%5D%2C%22Dose%22%3A%5B%221.01%22%2C%220.92%22%2C%225.44%22%2C%220.17%22%2C%220%22%2C%220.59%22%2C%220%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mcg%2Fkg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B0%2C60%2C180%2C360%5D%2C%22Event%22%3A%5B%22Start%22%2C%22CPB%20Start%22%2C%22CPB%20End%22%2C%22End%22%5D%2C%22Fill%22%3A%5B%22blue%22%2C%22red%22%2C%22brown%22%2C%22blue%22%5D%7D",
                      target="_blank"
                    )
                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "2.5 month-old girl, 5.2 kg, 58 inches, target = 1.0 ng/ml",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=%22Events%22&age=2.5&ageUnit=%220.08333333%22&caption=%22Girl%2C%202.5%20months%2C%205.2%20kg%2C%2058%20cm%22&client_time=%222%3A50%3A18%20PM%22&effectsiteLinetype=%22solid%22&height=58&heightUnit=%221%22&logY=false&maximum=%22360%22&normalization=%22none%22&plasmaLinetype=%22blank%22&referenceTime=%22none%22&sex=%22female%22&title=%22Infant%2C%20Target%20%3D%201.0%20ng%2Fml%22&typical=%22Range%22&weight=5.2&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%220%22%2C%2260%22%2C%22120%22%2C%22180%22%2C%22240%22%2C%22360%22%2C%22%22%5D%2C%22Dose%22%3A%5B%221.44%22%2C%221.32%22%2C%227.68%22%2C%220.24%22%2C%220%22%2C%220.84%22%2C%220%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mcg%2Fkg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B0%2C60%2C180%2C360%5D%2C%22Event%22%3A%5B%22Start%22%2C%22CPB%20Start%22%2C%22CPB%20End%22%2C%22End%22%5D%2C%22Fill%22%3A%5B%22blue%22%2C%22red%22%2C%22brown%22%2C%22blue%22%5D%7D",
                      target="_blank"
                    )
                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "Simulation of more complex dose regimen (table 2 and figure 3 in the editorial)",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=%22Events%22&age=2.5&ageUnit=%220.08333333%22&caption=%22Girl%2C%202.5%20months%2C%205.2%20kg%2C%2058%20cm%22&client_time=%221%3A01%3A29%20AM%22&cyp2d6=%22typical%22&effectsiteLinetype=%22solid%22&height=58&heightUnit=%221%22&logY=false&maximum=%22360%22&normalization=%22none%22&plasmaLinetype=%22blank%22&pregnant=%22FALSE%22&referenceTime=%22none%22&Refresh=1&renal=%22normal%22&sex=%22female%22&title=%22Infant%2C%20Target%20%3D%201.0%20ng%2Fml%22&typical=%22none%22&weight=5.2&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22dexmedetomidine%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%2210%22%2C%2260%22%2C%22120%22%2C%22180%22%2C%22180%22%2C%22%22%5D%2C%22Dose%22%3A%5B%2215%22%2C%222.5%22%2C%221%22%2C%22.1%22%2C%22.7%22%2C%22.9%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%2Fhr%22%2C%22mcg%2Fkg%22%2C%22mcg%2Fkg%2Fhr%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B0%2C60%2C180%2C360%5D%2C%22Event%22%3A%5B%22Start%22%2C%22CPB%20Start%22%2C%22CPB%20End%22%2C%22End%22%5D%2C%22Fill%22%3A%5B%22blue%22%2C%22red%22%2C%22brown%22%2C%22blue%22%5D%7D",
                      target="_blank"
                    )
                  )
                ) # end fluid row
              ), # end tabPanel for BJA Dexmedetomidine

              ################################################################################################
              tabPanel( # BJA Naloxone
                title = div(
                  style="text-align:center;",
                  HTML(
                    paste("Naloxone", "BJA 2019", sep = "<br/>")
                  )
                ),
                value = "BJA_Naloxone",
                tags$head(  #### Is this needed?
                  tags$style(
                    HTML(
                      '.nav-tabs>li>a {
                margin-right: 4px;
                border: 1px solid white;
                border-radius: 10px 10px 0 0;
                padding-top: 4px;
                padding-bottom: 4px;
                padding-left: 6px;
                padding-right: 6px;
                }'
                    ) # end HTML
                  ) # end tags$style
                ), # end tags$head
                fluidRow(
                  tags$p(
                    style = "padding: 40px; font-size: 16px",
                    'The examples below illustrate the pharmacokinetics of naloxone as described in',
                    tags$i(
                      "High-dose naloxone, an experimental tool uncovering
                      latent sensitisation: pharmacokinetics in humans."),
                    'by Papathanasiou and colleagues ',
                    tags$a(
                      "(BJA 2019;123:e204-e214). ",
                      href = "https://bjanaesthesia.org/article/S0007-0912(18)31375-8/fulltext"
                      ),
                    'These are simulations described in ',
                    'the accompanying editorial',
                    tags$i(
                      "Making Pharmacokinetics Useful"
                    ),
                    'by SL Shafer ',
                    tags$a(
                      "(BJA. 2019;123:406-407).",
                    href="https://bjanaesthesia.org/article/S0007-0912(19)30568-9/fulltext"
                    )
                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "Author's proposed dosing regimen",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=null&age=50&ageUnit=%221%22&caption=%22%22&client_time=%221%3A30%3A33%20PM%22&cyp2d6=%22typical%22&effectsiteLinetype=%22solid%22&height=66&heightUnit=%222.56%22&logY=false&maximum=%2260%22&normalization=%22none%22&plasmaLinetype=%22blank%22&pregnant=%22FALSE%22&referenceTime=%22none%22&Refresh=0&renal=%22normal%22&sex=%22male%22&shinyjs-delay-0c0f6f0d5b0c70395b2a0ccf26c05e51=0&title=%22Simulation%20on%202019-11-01%2020%3A30%3A31%22&typical=%22Range%22&weight=70&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22naloxone%22%2C%22naloxone%22%2C%22naloxone%22%2C%22naloxone%22%2C%22naloxone%22%2C%22naloxone%22%2C%22naloxone%22%2C%22%22%2C%22%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%221%22%2C%2225%22%2C%2226%22%2C%2250%22%2C%2251%22%2C%2275%22%2C%22%22%2C%22%22%2C%22%22%5D%2C%22Dose%22%3A%5B%221.5%22%2C%22.72%22%2C%224.5%22%2C%222.2%22%2C%2213.5%22%2C%226.5%22%2C%220%22%2C%22%22%2C%22%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mg%2Fmin%22%2C%22mg%2Fmin%22%2C%22mg%2Fmin%22%2C%22mg%2Fmin%22%2C%22mg%2Fmin%22%2C%22mg%2Fmin%22%2C%22mg%2Fmin%22%2C%22%22%2C%22%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B%5D%2C%22Event%22%3A%5B%5D%2C%22Fill%22%3A%5B%5D%7D",
                      target="_blank"
                    )
                  ),
                  tags$p(
                    style = "padding: 0 0 0 40px; font-size: 16px;",
                    tags$a(
                      "Regimen proposed by stanpumpR",
                      href="https://steveshafer.shinyapps.io/stanpumpr/?_inputs_&addedPlots=null&age=50&ageUnit=%221%22&caption=%22%22&client_time=%221%3A45%3A39%20PM%22&cyp2d6=%22typical%22&effectsiteLinetype=%22solid%22&height=66&heightUnit=%222.56%22&logY=false&maximum=%2260%22&normalization=%22none%22&plasmaLinetype=%22blank%22&pregnant=%22FALSE%22&referenceTime=%22none%22&Refresh=0&renal=%22normal%22&sex=%22male%22&shinyjs-delay-4318d8c7cea48cf8925189ea93dd0ff1=0&title=%22Simulation%20on%202019-11-01%2020%3A45%3A37%22&typical=%22Range%22&weight=70&weightUnit=%221%22&_values_&DT=%7B%22Drug%22%3A%5B%22naloxone%22%2C%22naloxone%22%2C%22naloxone%22%2C%22naloxone%22%2C%22naloxone%22%2C%22naloxone%22%2C%22naloxone%22%2C%22naloxone%22%2C%22naloxone%22%2C%22naloxone%22%2C%22%22%5D%2C%22Time%22%3A%5B%220%22%2C%221%22%2C%225%22%2C%2225%22%2C%2226%22%2C%2236%22%2C%2250%22%2C%2251%22%2C%2262%22%2C%2275%22%2C%22%22%5D%2C%22Dose%22%3A%5B%22.184%22%2C%22.0352%22%2C%22.0331%22%2C%22.345%22%2C%22.0855%22%2C%22.0965%22%2C%221.01%22%2C%22.266%22%2C%22.221%22%2C%220%22%2C%22%22%5D%2C%22Units%22%3A%5B%22mg%2Fkg%22%2C%22mg%2Fkg%2Fmin%22%2C%22mg%2Fkg%2Fmin%22%2C%22mg%2Fkg%22%2C%22mg%2Fkg%2Fmin%22%2C%22mg%2Fkg%2Fmin%22%2C%22mg%2Fkg%22%2C%22mg%2Fkg%2Fmin%22%2C%22mg%2Fkg%2Fmin%22%2C%22mg%2Fkg%2Fmin%22%2C%22%22%5D%7D&ET=%7B%22Time%22%3A%5B%5D%2C%22Event%22%3A%5B%5D%2C%22Fill%22%3A%5B%5D%7D",
                      target="_blank"
                    )
                  ) # end tags
                ) # end fluid row
              ) # end tabPanel for BJA Naloxone




            ) # end tabsetPanel
          ) # end fluidRow of examples
        ),  # end Examples tab item
        # Second tab content
        tabItem(
          tabName = "Help",
          h2("Help"),
          fluidRow(
            tabsetPanel(
              id = "tabId",

              ################################################################################################
              tabPanel(
                title = "Purpose",
                value = "purpose",
                fluidRow(
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                    "stanpumpR, a PK/PD simulation program"
                  ),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "stanpumpR, derived from the original STANPUMP program developed
                     at Stanford University, performs pharmacokinetic simulations
                     based on mathematical models published in the peer-reviewed literature.
                     stanpumpR is intended to help clinicians and investigators better
                     understand the mathematical implications of published models.
                     stanpumpR is only an advisory program. How these models are
                     applied to individual patients is a matter of clinical judgment
                     by the healthcare provider."
                  ) # end p
                ) # end fluid row
              ), # end tabPanel

              ################################################################################################
              tabPanel(
                title = "About",
                value = "about",
                fluidRow(
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                    "stanpumpR, a PK/PD simulation program"
                    ),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "stanpumpR is open-source software for pharmacokinetic / pharmacodynamic simulation.
                    It is intended to make pharmacokinetics accessible to facilitate perioperative
                    patient care, teaching, and research. stanpumpR may be freely downloaded and used
                    without restriction for non-commericial purposes."
                  ),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    'STANPUMP, a portmanteau of "Stanford" and "Pump", was developed in the Stanski/Shafer
                    laboratory at Stanford University from 1987 through 1997. STANPUMP was one of many
                    programs developed to control the delivery of intravenous anesthetics using
                    pharmacokinetic principles. At that time there was an active exchange of concepts
                    and algorithms among the authors. Significant contributors to this effort were
                    Schüttler and Schwilden at the University of Bonn (CATIA), Ausems and Hug at the
                    University of Leiden (TIAC), Reves and Alvis at the University of Alabama (CACI),
                    Jacobs and Reves at Duke University (CACI II), Coetzee and Pina at Stellenbosch
                    University (STELPUMP), and De Smet and Struys at the University of Ghent (RUGLOOP).
                    This history was recently reviewed by Struys and colleagues:
                    The History of Target-Controlled Infusion.',
                    tags$a(
                      "(Anesth Analg. 2016;122:56-69).",
                      href = "https://journals.lww.com/anesthesia-analgesia/fulltext/2016/01000/The_History_of_Target_Controlled_Infusion.15.aspx"
                    )
                  ),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "STANPUMP was placed in the public domain. The STANPUMP pharmacokinetic engine
                    was incorporated into many of the commerially available target controlled infusion
                    devices, where it is still used today."
                  ),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "stanpumpR uses very little of the original STANPUMP code. However, conceptually
                    it is identical: an open-source program to make complex pharmacokinetic algorithms
                    available to support patient care, teaching, and research. However, stanpumpR does
                    not control drug administration. It is simply a web-based simulator that uses the
                    Shiny package in R to simulate the expected concentration of intravenous anesthetics
                    from any dosing regimen."
                  ),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "It is hoped that stanpumpR will encourage device manufacturers to develop the next
                    generation of drug delivery systems and anesthesia information management systems.
                    Companies seeking to develop such systems should contact Dr. Shafer to request
                    written permission to incorporate stanpumpR into their products. The request should
                    also seek permission to assert patent or other intellectual property rights to
                    code derived, in part, from stanpumpR. Without written permission, stanpumpR algorithms
                    and program code may not be incorporated into commercially available systems."
                  ),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "stanpumpR is a collaborative research project. Individuals interested in adding
                    drugs, pharmacokinetic data sets, or new algorithms to stanpumpR are encourage
                    to contact Dr. Shafer. It is hoped that eventually each drug in the stanpumpR
                    library will be maintained by an investigator, who will assume responsibility
                    for keeping the pharmacokinetics as up-to-date as possible."
                  ),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "Steven L. Shafer, MD October 2019"
                  ),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "Copyright 2019 Steven L. Shafer, MD. All rights reserved"
                  ) # end p
                ) # end fluid row
              ), # end tabPanel

              ################################################################################################
              tabPanel(
                title = "Covariates",
                value = "Covariates",
                fluidRow(
                  tags$p(""),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "The subject covariates are age, weight, height, sex, pregnancy, CYP2D6, and renal function.
                    Pharmacokinetics are adjusted for these covariates only to the extent that the original
                    investigator included the covariates in the pharmacokinetic model. If the investigator
                    was not explicit whether the pharmacokinetics scaled to weight, then the pharmacokinetics are not
                    assumed to be weight proportional."
                  ),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "Age can be entered in years or in months. The default is years. Weight can be entered
                    in kilograms or pounds. The default is kilograms. Height can be entered in centimeters or
                    inches. The (surprising) default is inches. This was chosen because US clinicians
                    have not adapted to thinking of height in terms of centimeters. The default sex is
                    female."
                  ),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "The pregnancy covariate only appears for women of childbearing age, currently set to
                    12-59 years."
                  ),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "The CYP2D6 and renal failure covariates are currently not used. As models are added
                    that incorporate CYP2D6 status, or renal disease, then they will be incorporated into
                    those models."
                  ), # end p
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "Additional covariates may be added over time, as required to implement published
                    pharmacokinetic models."
                  ) # end p

                ) # end fluid row
              ), # end tabPanel

              ################################################################################################
              tabPanel(
                title = "Drugs",
                value = "Drugs",
                fluidRow(
                  style = "padding-left: 40px; ",

                  tabsetPanel(
                    id = "tabId",

                    ################################################################################################
                    # Alfentanil *************
                    tabPanel(
                      title = "Alfentanil",
                      value = "Alfentanil",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Alfentanil"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for alfentanil are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Dexmedetomidine *************
                    tabPanel(
                      title = "Dexmedetomidine",
                      value = "Dexmedetomidine",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Dexmedetomidine"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for dexmedetomidine are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Etomidine *************
                    tabPanel(
                      title = "Etomidate",
                      value = "Etomidine",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Etomidine"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for etomidine are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Fentanyl *************
                    tabPanel(
                      title = "Fentanyl",
                      value = "Fentanyl",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Fentanyl"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for fentanyl are taken from Scott and Stanski"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Hydromorphone *************
                    tabPanel(
                      title = "Hydromorphone",
                      value = "Hydromorphone",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Hydromorphone"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for hydromorphone are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Ketamine *************
                    tabPanel(
                      title = "Ketamine",
                      value = "Ketamine",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Ketamine"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for ketamine are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Lidocaine *************
                    tabPanel(
                      title = "Lidocaine",
                      value = "Lidocaine",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Lidocaine"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for lidocaine are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Methadone *************
                    tabPanel(
                      title = "Methadone",
                      value = "Methadone",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Methadone"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for methadone are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Midazolam *************
                    tabPanel(
                      title = "Midazolam",
                      value = "Midazolam",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Midazolam"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for midazolam are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Morphine *************
                    tabPanel(
                      title = "Morphine",
                      value = "Morphine",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Morphine"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for morphine are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Naloxone *************
                    tabPanel(
                      title = "Naloxone",
                      value = "Naloxone",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Naloxone"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for naloxone are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # oxycodone *************
                    tabPanel(
                      title = "Oxycodone",
                      value = "Oxycodone",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Oxycodone"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for oxycodone are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Oxytocin *************
                    tabPanel(
                      title = "Oxytocin",
                      value = "Oxytocin",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Oxytocin"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for oxytocin are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Pethidine *************
                    tabPanel(
                      title = "Pethidine",
                      value = "Pethidine",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Pethidine"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for pethidine (called 'meperidine' in the United States) are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Propofol *************
                    tabPanel(
                      title = "Propofol",
                      value = "Propofol",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Propofol"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for propofol are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Remifentanil *************
                    tabPanel(
                      title = "Remifentanil",
                      value = "Remifentanil",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Remifentanil"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for remifentanil are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Rocuronium *************
                    tabPanel(
                      title = "Rocuronium",
                      value = "Rocuronium",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Rocuronium"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for rocuronium are taken from"
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Sufentanil *************
                    tabPanel(
                      title = "Sufentanil",
                      value = "Sufentanil",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Sufentanil"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The pharmacokinetics for sufentanil are taken from"
                        ) # end p
                      ) # end fluid row
                    ) # end tabPanel

                  ) # end tabsetPanel
                ) # end fluid row
              ), # end tabPanel

              ################################################################################################
              tabPanel(
                title = "Added Plots",
                value = "AddedPlots",
                fluidRow(
                  style = "padding-left: 40px; ",

                  tabsetPanel(
                    id = "tabId",

                    ################################################################################################
                    # MEAC *************
                    tabPanel(
                      title = "MEAC",
                      value = "MEAC",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "MEAC"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The mean effective analgesic concentration (MEAC) is a commonly used measure
			                     of opioid potency. Ideally, it is measured at steady state to ensure that the
                           plasma concentration has equilibrated with the concentration at the site of
                           drug effect. "
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Interaction *************
                    tabPanel(
                      title = "Interaction",
                      value = "Interaction",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Interaction"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The interaction plot is intended to show the interaction among
                          hypnotics and opioids in mediating loss of response to noxious
                          stimulation. Currently it only shows the interaction between
                          opioids and propofol. "
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Events  *************
                    tabPanel(
                      title = "Events",
                      value = "Events",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Events"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The events plot adds a line where specific events are noted. At present,
                          the only consequential events are 'CPB Start', 'CPB End', and 'CPB 37',
                          'CPB 36', 'CPB 35', 'CPB 34', 'CPB 33', and 'CPB 32', all of which are
                          used to adjust the pharmacokinetics of dexmedetomidine in neonates and
                          infants undergoing cardiopulmonary bypass. "
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    ################################################################################################
                    # Time to Emergence *************
                    tabPanel(
                      title = "Time To ...",
                      value = "Timeto",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Time To ..."
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The 'Time to ...' plot calculates the time required to reach
                          a specific effect site concentration. If the drug is an
                          hypnotic, then it is the time to reach a concentration
                          associated with emergence from anesthesia. If the drug is an
                          opioid, then it is the time required to reach the MEAC, a concentration
                          that should be analgesic but sufficiently low to ensure adequate
                          ventilation. If the drug is an antibiotic, then it is the time until
                          the concentrations reach the MIC, implying the need to redose the
                          antibiotic. "
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The 'Time to ...' plot is intended to replace 'recovery
                          curves' (ref shafer), 'context-sensitive half-time' (ref hughes),
                          and 'decrement time' by calculating the time for the concentration
                          from any arbitrary dose schedule to reach a particular effect-site
                          concentraion."
                          ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The target concentration can be edited by clicking on
                          the graph. The target concentration appears at the bottom of
                          the dialog box."
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The calculation is expensive in terms of computer time.
                          The reason is that with multicompartment pharmacokinetics
                          there is no closed-form solution to calculate the time
                          for the effect site concentration to decrease to a specific
                          number. Instead, stanpumpR uses a numerically optimized solver
                          function to find required for the concentration to decrease to
                          the target concentration on the assumption that drug administration
                          is stopped at each point in time. This increases
                          the computational burden nearly 100 fold."
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "The 'log Y' option is disabled when 'Time to ...' is
                          selected. The reason is that it makes no sense to display
                          the log of the time to reach a certain concentration.
                          Also, it requires plotting the log(0), which is -infinity."
                        ) # end p
                      ) # end fluid row
                    ) # end tabPanel

                  ) # end tabsetPanel
                ) # end fluid row
              ), # end tabPanel



              ################################################################################################
              tabPanel(
                title = "How to ...",
                value = "HowTo",
                fluidRow(
                  style = "padding-left: 40px; ",

                  tabsetPanel(
                    id = "tabId",

                    ################################################################################################
                    # Add a drug *************
                    tabPanel(
                      title = "Add a drug",
                      value = "AddDrug",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Add a drug"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "There are two ways to add a drug. You can simply
                          enter the name of the drug on a blank line in the dose table.
                          You can also double click on any plot. In the dialog box, the
                          top line shows all of the drugs known to stanpumpR. If you select
                          a drug not already on the graph, it will add a new line to the dose
                          table, and the new drug will appear in the simulation."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    # Delete a drug *************
                    tabPanel(
                      title = "Delete a drug",
                      value = "Delete a drug",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Add a drug"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "There are two ways to add a drug. You can simply
                          enter the name of the drug on a blank line in the dose table.
                          You can also double click on any plot. In the dialog box, the
                          top line shows all of the drugs known to stanpumpR. If you select
                          a drug not already on the graph, it will add a new line to the dose
                          table, and the new drug will appear in the simulation."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    # Add a dose *************
                    tabPanel(
                      title = "Add a dose",
                      value = "AddDose",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Add a drug"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "There are two ways to add a dose for any drug. The easiest way
                          is to simply click on the drug plot. This will bring up a
                          dialog to add another dose. The time shown corresponds to the time
                          axis of where you clicked, but you can enter any time."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    # Edit a dose *************
                    tabPanel(
                      title = "Edit a dose",
                      value = "EditDose",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Edit a drug"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "There are two ways to edit any dose for any drug. If you only
                          have a few entries, then you can find the dose in the dose table
                          and simply edit the number. However, if there are many entries,
                          then it may be easier to edit the dose using the dialog box.
                          Double Click on the dialog box. You will have the option to
                          edit prior doses."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    tabPanel(
                      title = "Delete a dose",
                      value = "Delete a dose",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Edit a drug"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "There are two ways to delete a dose. First, if you right
                          click on the dose table, you will have an option to remove
                          a row. This (of course) removes the drug dose on that row.
                          You can also double click on a graph, which opens a dialog.
                          One option is to edit prior entries. Select this, and
                          you will have the optio to remove any / all of the drug
                          doses for that drug."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel


                    tabPanel(
                      title = "Add/Edit Events",
                      value = "AddEditEvents",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Edit a drug"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "There are two ways to edit any dose for any drug. If you only
                          have a few entries, then you can find the dose in the dose table
                          and simply edit the number. However, if there are many entries,
                          then it may be easier to edit the dose using the dialog box.
                          Double Click on the dialog box. You will have the option to
                          edit prior doses."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel

                    tabPanel(
                      title = "Save your work",
                      value = "SaveYourWork",
                      fluidRow(
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                          "Saving your work"
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "stanpumpR does not have the ability to save your work in
                          the file system. However, you can send a copy of your
                          graph by entering your e-mail address in the lower right
                          of the display. Once a valid e-mail address appears, you
                          will see a button 'send slide.' This will send a powerpoint
                          file with your slide. It will also send you a link. The
                          link has the information to restore your session. It will
                          also send you an Excel spreadsheet. The Excel spreadsheet
                          has all of the pharmacokinetic calculations used to create
                          the slide."
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "Please note that the URL contained in the link
                          will invoke whatever version of stanpumpR is deployed
                          to the shiny server. There is no guarantee that the
                          drug pharmacokinetics will be the same. For example, if
                          stanpumpR does not have the ability to save your work if
                          the pharmacokinetics of fentanyl have been 'upgraded'
                          to a more comprehensive model, the simulations will be
                          run with the new fentanyl pharmacokinetics."
                        ),
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "There is even a possibility that the shiny developers
                          could change the handling of URLs, which is currently a
                          little clumsy. If so, then the link itself might not work
                          in the future, despite my efforts to maintain backward compatibility
                          with prior releases of stanpumpR."
                        ) # end p
                      ) # end fluid row
                    ) # end tabPanel
                  ) # end tabset Panel
                ) # end fluid row
              ), # end tabPanel # How to

              ################################################################################################
              tabPanel(
                title = "Suggest",
                value = "Suggest",
                fluidRow(

                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 18px; font-weight: bold;",
                    "The 'Suggest' button"
                  ),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "The original STANPUMP program calculated a series of infusion rates to rapidly
                    achieve and maintain target concentrations at the site of drug
                    effect, as set by the clinician. These devices are used around
                    the world. To accomplish this, STANPUMP calculated a new infusion
                    rate every 10 seconds, maintaining the calcualted effect site
                    concentration very close to the desired target."
                  ),
                  tags$p(
                    style = "padding: 0 40px 0 40px; font-size: 16px",
                    "stanpumpR does not directly control any devices, but it
                    tries to approximate the accuracy of STANPUMP by suggesting a
                    simple regimen of bolus doses and infusion rates that very
                    nearly reach and maintain steady state concentration at the
                    site of drug effect. stanpumpR is not making any dosing recommendations
                    in performing these calculations. Rather, it is simply executing
                    the mathematics necessary to compute the bolus doses and infusion
                    rates that, based on the pharmacokinetic model, would achieve
                    a concentration very close to the target concentration entered by
                    the clinician."
                  ) # end p
                ) # end fluid row
              ), # end tabPanel # SUGGEST


              ################################################################################################
              tabPanel(
                title = "Acknowledgements",
                value = "Acknowledgements",
                fluidRow(
                  style = "padding-left: 10px; ",
                  tags$p(
                    style = "padding: 10px 20px 10px 20px; font-size: 14px",
                    "stanpumpR reflects the contributions of many scientists and
                      clinicians in the development of mathematical models of drug
                      behavior necessary to predict drug concentration from arbitrary
                      doses.  The list of contributors is incomplete. Please forward any names that
                      should be included to steven.shafer@stanford.edu."
                  ), # end p

                  tabsetPanel(
                    id = "tabId",

                    # Max Ausems  *************
                    tabPanel(
                      title = "Max Ausems",
                      value = "Ausems",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Ausems

                    # Jim Bailey  *************
                    tabPanel(
                      title = "Jim Bailey",
                      value = "Bailey",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Bailey

                    # Coetzee  *************
                    tabPanel(
                      title = "Johan Coetzee",
                      value = "Coetzee",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Coetzee

                    # Ignacio Cortinez  *************
                    tabPanel(
                      title = "Ignacio Cortinez",
                      value = "Cortinez",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Cortinez

                    # Thomas De Smet  *************
                    tabPanel(
                      title = "Thomas De Smet",
                      value = "DeSmet",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel De Smet

                    # Doug Eleveld *************
                    tabPanel(
                      title = "Doug Eleveld",
                      value = "Eleveld",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Eleveld

                    # Talmage Egan  *************
                    tabPanel(
                      title = "Talmage Egan",
                      value = "Egan",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Egan

                    # Frank Engbers *************
                    tabPanel(
                      title = "Frank Engbers",
                      value = "Engbers",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Engbers

                    # Pedro Gambus  *************
                    tabPanel(
                      title = "Pedro Gambus",
                      value = "Gambus",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Gambus

                    # Peter Glass  *************
                    tabPanel(
                      title = "Peter Glass",
                      value = "Glass",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Glass

                    # Iain Glen *************
                    tabPanel(
                      title = "Iain Glen",
                      value = "IainGlen",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Glen

                    # Jim Jacobs *************
                    tabPanel(
                      title = "Jim Jacobs",
                      value = "Jacobs",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Jacobs

                    # Gavin Kenny  *************
                    tabPanel(
                      title = "Gavin Kenny",
                      value = "Kenny",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Kenny

                    # Charles Minto  *************
                    tabPanel(
                      title = "Charles Minto",
                      value = "Minto",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Minto

                    # Jerry Reves  *************
                    tabPanel(
                      title = "Jerry Reves",
                      value = "Reves",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Reves

                    # Steve Shafer  *************
                    tabPanel(
                      title = "Steve Shafer",
                      value = "Shafer",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Shafer

                    # Thomas Schnider *************
                    tabPanel(
                      title = "Thomas Schnider",
                      value = "Schnider",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Schnider

                    # Helmut Schwilden *************
                    tabPanel(
                      title = "Helmut Schwilden",
                      value = "Schwilden",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Schwilden

                    # Pablo Sepulvada  *************
                    tabPanel(
                      title = "Pablo Sepulveda",
                      value = "Sepulveda",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Sepulvada

                    # Don Stanski *************
                    tabPanel(
                      title = "Don Stanski",
                      value = "Stanski",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Stanski

                    # Andres Stutzin  *************
                    tabPanel(
                      title = "Andres Stutzin",
                      value = "Stutzin",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Stutzin

                    # Michel Struys  *************
                    tabPanel(
                      title = "Michel Struys",
                      value = "Struys",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ), # end tabPanel Struys

                    # Dwayne Westenskow  *************
                    tabPanel(
                      title = "Dwayne Westenskow",
                      value = "Westenskow",
                      fluidRow(
                        style = "padding-left: 40px; ",
                        tags$p(
                          style = "padding: 0 40px 0 40px; font-size: 16px",
                          "."
                        ) # end p
                      ) # end fluid row
                    ) # end tabPanel Struys



                  ) #tabsetPanel
                ) # fluidRow
              ) #tabPanel ACKNOWLEDGEMENTS


            ) # end tabset Panel
          ) # end fluidRow
        ) # end tabItem
      ) # end tabItems

      # Code to display messages
      # fluidRow(
      #   column(
      #     12,
      #     wellPanel(
      #       id = "logSection",
      #       uiOutput("logContent")
      #     ) # end wellPanel
      #   ) # end Column
      # ) # end fluidRow

    ) # end dashboardBody
  ) # end dashboardPage
}

