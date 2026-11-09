#import "@preview/fletcher:0.5.8" as fletcher: *
#import fletcher.shapes: house, hexagon
#import "helpers.typ": ternary, tint, tup-sum, rel, bolden
#set page(
    width: auto,
    height: auto,
    margin: 10mm,
    fill: white,
)

#text(size: 50pt, weight: "bold")[
    Vítor Luís Costa Azevedo |
    PCC |
    221020780 |
    20 de Outubro de 2026
]

#set text(font: "Liberation Serif")

#let blob(pos, label, tint: white, lighten: 60%, ..args) = node(
	pos, align(center, label),
	width: 28mm,
	fill: if (lighten == none) {tint} else {tint.lighten(lighten)},
	stroke: 1pt + tint.darken(20%),
	corner-radius: 5pt,
	..args,
)

#diagram(
    debug: false,
	spacing: 12pt,
	cell-size: (8mm, 10mm),
	edge-stroke: 1pt,
	edge-corner-radius: 5pt,
	mark-scale: 70%,

	{
    blob((0,0), tint(white)[ABNT NBR 12721], tint: black, shape: circle, lighten: none, name: <home>)
    edge("ru", "-|>")
    edge("rd", "-|>")
    edge("ld", "-|>")
    edge("lu", "-|>")
	
    // upper right
    // Definições
    let ur(x, y) = tup-sum((1, -1), (x, y))
    blob(ur(0,0), [Definições e Tipologia de Áreas], tint: yellow, name: <b1>)
    edge(rel(0,0), <conceitos_eq>, "-|>")
    edge(rel(0,0), <priv_com>, "-|>")
    edge(rel(0,0), rel(2,0), <acab_com>, "-|>")


    blob(ur(4,0), [Conceitos de Equivalência], tint: yellow, shape: house, lighten: 70%, name: label("conceitos_eq"))
    let this_width = 7cm
    let area_lbls = range(1,3+1).map(v => label("area_" + str(v)))
    blob(rel(1,-3), align(left)[
        = #bolden[Área Real]
            - Superfície *física*
            - Diretamente da arquitetura
            - Incluindo Projeções
    ], tint: yellow, lighten: 80%, width: this_width, name: area_lbls.at(0))
    blob(rel(0,1), align(left)[
        = #bolden[Área Coberta / Descoberta]
            - Cobertura física sobre a depend.
            - E.g. Terraços, estacionamentos, jardins
    ], tint: yellow, lighten: 80%, width: this_width, name: area_lbls.at(1))
    blob(rel(0,1), align(left)[
        = #bolden[Área Equivalente]
            - Área *virtual*
            - Ocorre quando acabamentos reduzem a área real, mas não a quantidade de serviço
    ], tint: yellow, lighten: 80%, width: this_width, name: area_lbls.at(2))

    blob(rel(0,1), [
        *Observar*:
        - 5.7.2.1
        - 5.7.3
    ], tint: yellow, lighten: 80%, name: <area_obs>)
    edge(<conceitos_eq.east>, <area_obs.west>, "-|>")

    for i in range(1,3+1) {
        edge(<conceitos_eq.north>, rel(0,-3.5+i),label("area_"+ str(i) + ".west"), "-|>")
    }


    blob(ur(0,-1), [Vagas de Garagem], tint: yellow, shape: house, lighten: 70%, name: label("priv_com"))


    let this_width = 7cm
    let vaga_lbls = range(1,4+1).map(v => label("vaga_" + str(v)))
    blob(rel(1,-4), align(left)[
        = #bolden[Vinculada à unidade autônoma]
        - Uso exclusivo
        - *Não possui* fração ideal no terreno
        - Área priv. principal
    ], tint: yellow, lighten: 80%, width: this_width, name: vaga_lbls.at(0))
    blob(rel(0,1), align(left)[
        = #bolden[Como unidade autônoma]
        - Acesso independente das demais vagas
        - Demarcada e identificada em projeto
        - *Possui* fração ideal própria no terreno e partes comuns
    ], tint: yellow, lighten: 80%, width: this_width, name: vaga_lbls.at(1))
    blob(rel(0,1), align(left)[
        = #bolden[Uso comum (com direito de uso)]
        - Demarcada apenas para quantificação
        - Direito de uso atribuído à unidade autônoma
        - Divisão *não proporcional*
    ], tint: yellow, lighten: 80%, width: this_width, name: vaga_lbls.at(2))
    blob(rel(0,1), align(left)[
        = #bolden[Uso comum (sem direito de uso)]
        - Demarcada apenas para quantificação
        - Sem direito de uso atribuído à unidade
        - Divisão *proporcional*
    ], tint: yellow, lighten: 80%, width: this_width, name: vaga_lbls.at(3))

    blob(rel(0,1), [
        *Observar*:
        - 3.7.2.2.2
        - 3.7.2.2.3
    ], tint: yellow, lighten: 80%, name: <vaga_obs>)
    edge(<priv_com.east>, <vaga_obs.west>, "-|>")

    for i in range(1,4+1) {
        edge(<priv_com.north>, rel(0,-4.5+i),label("vaga_"+ str(i) + ".west"), "-|>")
    }

    blob(ur(2,-1), [Acabamento e Proj. Padrão], tint: yellow, shape: house, lighten: 70%, name: label("acab_com"))

    let this_width = 7cm
    let acab_lbls = range(1,2+1).map(v => label("acab_" + str(v)))
    blob(rel(1,-2), align(left)[
        = #bolden[Padronização]
        - R-1 - unifamiliar
        - R-8 / 16 - multifamiliares
        - PP - Prédio Popular
        - PIS - Interesse social
        - CSL - Comercial, salas, lojas
        - CAL - Comercial, andar livre
        - GI - Galpões
    ], tint: yellow, lighten: 80%, width: this_width, name: acab_lbls.at(0))
    blob(rel(0,1), align(left)[
        = *Padrões*
        - Baixo
        - Normal
        - alto
    ], tint: yellow, lighten: 80%, width: this_width, name: acab_lbls.at(1))


    blob(rel(0,1), [
        *Observar*:
        - Tabelas 2 e 3 (descrição dos materiais)
    ], tint: yellow, lighten: 80%, name: <acab_obs>)
    edge(<acab_com.east>, <acab_obs.west>, "-|>")

    for i in range(1,2+1) {
        edge(<acab_com.north>, rel(0,-2.5+i),label("acab_"+ str(i) + ".west"), "-|>")
    }



    // lower right
    // Quadros
    let lr(x, y) = tup-sum((1,1), (x, y))
    blob(lr(0,0), [Quadro de Áreas e Frações Ideais], tint: red, name: <b2>)
    edge(rel(0,0), <frac_ideal>, "-|>")
    edge(rel(0,0), <rateio_custos>, "-|>")
    edge(rel(0,0), rel(2,0), <subrogacao>, "-|>")
    edge(rel(0,0), rel(-.8,.5), rel(0,5), <quads>, "-|>")

    // --- Frações Ideais ---
    blob(lr(4,0), [Frações Ideais], tint: red, shape: house, lighten: 70%, name: label("frac_ideal"))
    let this_width = 7cm
    let frac_lbls = range(1,4+1).map(v => label("frac_" + str(v)))
    blob(rel(1,4), align(left)[
        = #bolden[Coeficiente de proporcionalidade]
        - Proporção entre a área equivalente da unidade e a global
        - *Não* baseado apenas na área privativa real
    ], tint: red, lighten: 80%, width: this_width, name: frac_lbls.at(0))
    blob(rel(0,-1), align(left)[
        = #bolden[Vinculação à unidade]
        - Parte *inseparável* da unidade (3.13)
        - Expressa em decimal ou ordinária
    ], tint: red, lighten: 80%, width: this_width, name: frac_lbls.at(1))
    blob(rel(0,-1), align(left)[
        = #bolden[Distinção quanto à vaga]
        - Vaga vinculada: *sem* fração ideal própria
        - Vaga autônoma: *com* fração ideal própria
    ], tint: red, lighten: 80%, width: this_width, name: frac_lbls.at(2))
    blob(rel(0,-1), align(left)[
        = #bolden[Cota proporcional (3.16)]
        - Despesas ordinárias e extraordinárias de condomínio
        - Calculada conforme convenção
    ], tint: red, lighten: 80%, width: this_width, name: frac_lbls.at(3))

    blob(rel(0,-1), [
        *Observar*:
        - 3.13, 3.14 e 3.16
        - 5.8.2
    ], tint: red, lighten: 80%, name: <frac_obs>)
    edge(<frac_ideal.east>, <frac_obs.west>, "-|>")

    for i in range(1,4+1) {
        edge(<frac_ideal.south>, rel(0, 4.5-i), label("frac_"+ str(i) + ".west"), "-|>")
    }

    // --- Rateio de Custos ---
    blob(lr(0,1), [Rateio de Custos], tint: red, shape: house, lighten: 70%, name: label("rateio_custos"))
    let rateio_lbls = range(1,4+1).map(v => label("rateio_" + str(v)))
    blob(rel(1,4), align(left)[
        = #bolden[Critério de proporcionalidade]
        - Segue estritamente as áreas equivalentes (7.1)
        - Não usa área privativa bruta
    ], tint: red, lighten: 80%, width: this_width, name: rateio_lbls.at(0))
    blob(rel(0,-1), align(left)[
        = #bolden[Construção por administração]
        - Rateio proporcional entre os condôminos
        - Atualização periódica conforme orçamento
    ], tint: red, lighten: 80%, width: this_width, name: rateio_lbls.at(1))
    blob(rel(0,-1), align(left)[
        = #bolden[Custo real vs. estimado]
        - Sobras devolvidas ao condômino
        - Faltas complementadas por ele (11.2.2.3)
    ], tint: red, lighten: 80%, width: this_width, name: rateio_lbls.at(2))
    blob(rel(0,-1), align(left)[
        = #bolden[Aplicação do CUB]
        - Custo unitário × área equivalente
        - Base para o custo da unidade (6.3.4)
    ], tint: red, lighten: 80%, width: this_width, name: rateio_lbls.at(3))

    blob(rel(0,-1), [
        *Observar*:
        - 7.1 e 7.1.1
        - 6.3.4 e 11.2.2.3
    ], tint: red, lighten: 80%, name: <rateio_obs>)
    edge(<rateio_custos.east>, <rateio_obs.west>, "-|>")

    for i in range(1,4+1) {
        edge(<rateio_custos.south>, rel(0, 4.5-i), label("rateio_"+ str(i) + ".west"), "-|>")
    }

    // --- Sub-rogação ---
    blob(lr(2,1), [Sub-rogação], tint: red, shape: house, lighten: 70%, name: label("subrogacao"))
    let subrog_lbls = range(1,4+1).map(v => label("subrog_" + str(v)))
    blob(rel(1,4), align(left)[
        = #bolden[Definição (3.12)]
        - Unidades entregues ao proprietário do terreno
        - Custeio transferido aos demais adquirentes
    ], tint: red, lighten: 80%, width: this_width, name: subrog_lbls.at(0))
    blob(rel(0,-1), align(left)[
        = #bolden[Coeficiente re-rateio (3.15)]
        - Coeficientes das unidades sub-rogadas redistribuídos
        - Proporção dos coeficientes de construção das demais
    ], tint: red, lighten: 80%, width: this_width, name: subrog_lbls.at(1))
    blob(rel(0,-1), align(left)[
        = #bolden[Colunas auxiliares]
        - Colunas 43 a 47 para o re-rateio
        - Coluna 48: quota de área dada em pagamento
    ], tint: red, lighten: 80%, width: this_width, name: subrog_lbls.at(2))
    blob(rel(0,-1), align(left)[
        = #bolden[Custo da sub-rogação (6.3.5)]
        - Diferença entre custo total e custo próprio
        - Suportado pelas unidades não sub-rogadas
    ], tint: red, lighten: 80%, width: this_width, name: subrog_lbls.at(3))

    blob(rel(0,-1), [
        *Observar*:
        - 3.12, 3.15, 6.3.5
        - 7.2
    ], tint: red, lighten: 80%, name: <subrog_obs>)
    edge(<subrogacao.east>, <subrog_obs.west>, "-|>")

    for i in range(1,4+1) {
        edge(<subrogacao.south>, rel(0, 4.5-i), label("subrog_"+ str(i) + ".west"), "-|>")
    }

    blob(ur(0,8), bolden[QUADROS], tint: red, lighten: 70%, shape: hexagon, name: <quads>)
    edge("d", "->")

    let quads = (
        "I": "Cálculo das áreas nos pavimentos e da área global",
        "II": "Cálculo das áreas de unidades autônomas",
        "III": "Avaliação do custo global e unitário",
        "IV-A": "Avaliação do custo de construção de cada unidade autônoma e cálculo do re-rateio de sub-rogação",
        "IV-B": "Resumo das áreas reais para os atos de registro",
        "V a VIII": "Memoriais descritivos",
    )
    let this_width = 5cm
    let i = 1
    for q in quads.keys() {
        blob(ternary(q == quads.keys().at(0), rel(0,1), rel(1,-1)), bolden[Quadro #q], name: label("quad"+str(i)))
        edge("d", "-|>")
        blob(rel(0,1), [#quads.at(q)], width:  this_width, tint: red, lighten: 85%)
        if (q != quads.keys().at(-1)) {
            edge(<quads>, rel(i , 0), "d", "-|>")
        }
        i += 1
    }

    /*
    for q in quads.keys() {
        blob(rel(ternary(first_it, 0, -1),1), bolden[Quadro #q], tint: red, lighten: 75%)
        if q != quads.keys().at(-1) {edge("d", "->")}
        edge("r", "-|>")
        blob(rel(1,0), [#quads.at(q)], width:  this_width, tint: red, lighten: 85%)
        if first_it {
            first_it = false
        }
    }
    */
    


    // lower left
    // costs
    let ll(x, y) = tup-sum((-1,1), (x, y))
    blob(ll(0,0), [Custos], tint: green, name: <b3>)
    edge(rel(0,0), <cub_comp>, "-|>")
    edge(rel(0,0), <cub_fora>, "-|>")
    edge(rel(0,0), rel(-2,0), <cub_analitico>, "-|>")

    // --- Composição do CUB ---
    blob(ll(-4,0), [Composição do CUB], tint: green, shape: house, lighten: 70%, name: label("cub_comp"))
    let this_width = 5cm
    let cub_comp_lbls = range(1,4+1).map(v => label("cub_comp_" + str(v)))
    blob(rel(-1,4), align(left)[
        = #bolden[Cálculo mensal]
        - Pelos Sinduscon
    ], tint: green, lighten: 80%, width: this_width, name: cub_comp_lbls.at(0))
    blob(rel(0,-1), align(left)[
        = #bolden[Insumos]
        - Materiais, mão-de-obra, admin., equip.
    ], tint: green, lighten: 80%, width: this_width, name: cub_comp_lbls.at(1))
    blob(rel(0,-1), align(left)[
        = #bolden[Coleta]
        - Mensal, junto às construtoras
    ], tint: green, lighten: 80%, width: this_width, name: cub_comp_lbls.at(2))
    blob(rel(0,-1), align(left)[
        = #bolden[Base]
        - Posto obra, com tributos e frete
    ], tint: green, lighten: 80%, width: this_width, name: cub_comp_lbls.at(3))

    blob(rel(0,-1), [
        *Observar*:
        - 8.3.3 e 8.3.4
    ], tint: green, lighten: 80%, name: <cub_comp_obs>)
    edge(<cub_comp.west>, <cub_comp_obs.east>, "-|>")

    for i in range(1,4+1) {
        edge(<cub_comp.south>, rel(0, 4.5-i), label("cub_comp_"+ str(i) + ".east"), "-|>")
    }

    // --- Itens Fora do CUB ---
    blob(ll(0,1), [Itens Fora do CUB], tint: green, shape: house, lighten: 70%, name: label("cub_fora"))
    let cub_fora_lbls = range(1,4+1).map(v => label("cub_fora_" + str(v)))
    blob(rel(-1,4), align(left)[
        = #bolden[Fundações]
        - Especiais, acima de 2,50 m
    ], tint: green, lighten: 80%, width: this_width, name: cub_fora_lbls.at(0))
    blob(rel(0,-1), align(left)[
        = #bolden[Equipamentos]
        - Elevadores, fogões, ar-cond., aquecedores
    ], tint: green, lighten: 80%, width: this_width, name: cub_fora_lbls.at(1))
    blob(rel(0,-1), align(left)[
        = #bolden[Obras complementares]
        - Urbanização, piscinas, paisagismo
    ], tint: green, lighten: 80%, width: this_width, name: cub_fora_lbls.at(2))
    blob(rel(0,-1), align(left)[
        = #bolden[Despesas indiretas]
        - Projetos, taxas, remunerações
    ], tint: green, lighten: 80%, width: this_width, name: cub_fora_lbls.at(3))

    blob(rel(0,-1), [
        *Observar*:
        - 8.3.5
        - Orçar no Quadro III
    ], tint: green, lighten: 80%, name: <cub_fora_obs>)
    edge(<cub_fora.west>, <cub_fora_obs.east>, "-|>")

    for i in range(1,4+1) {
        edge(<cub_fora.south>, rel(0, 4.5-i), label("cub_fora_"+ str(i) + ".east"), "-|>")
    }

    // --- CUB vs. Orçamento Analítico ---
    blob(ll(-2,1), [CUB vs. Analítico], tint: green, shape: house, lighten: 70%, name: label("cub_analitico"))
    let cva_lbls = range(1,4+1).map(v => label("cva_" + str(v)))
    blob(rel(-1,4), align(left)[
        = #bolden[CUB]
        - Estimativa expedita de registro
    ], tint: green, lighten: 80%, width: this_width, name: cva_lbls.at(0))
    blob(rel(0,-1), align(left)[
        = #bolden[Validade]
        - Até 6 meses (construção por admin.)
    ], tint: green, lighten: 80%, width: this_width, name: cva_lbls.at(1))
    blob(rel(0,-1), align(left)[
        = #bolden[Transição]
        - Projetos completos → analítico
    ], tint: green, lighten: 80%, width: this_width, name: cva_lbls.at(2))
    blob(rel(0,-1), align(left)[
        = #bolden[Analítico]
        - Composições correntes (Anexo B)
    ], tint: green, lighten: 80%, width: this_width, name: cva_lbls.at(3))

    blob(rel(0,-1), [
        *Observar*:
        - 12.5 e 12.6
    ], tint: green, lighten: 80%, name: <cva_obs>)
    edge(<cub_analitico.west>, <cva_obs.east>, "-|>")

    for i in range(1,4+1) {
        edge(<cub_analitico.south>, rel(0, 4.5-i), label("cva_"+ str(i) + ".east"), "-|>")
    }

    // top left
    // Gestão e BIM
    let ul(x, y) = tup-sum((-1, -1), (x, y))
    blob(ul(0,0), [Gestão, Auditoria e BIM], tint: blue, name: <b4>)
    edge(rel(0,0), <rastreab>, "-|>")
    edge(rel(0,0), <bim_regras>, "-|>")
    edge(rel(0,0), rel(-2,0), <bim_auto>, "-|>")

    // --- Rastreabilidade ---
    blob(ul(-4,0), [Rastreabilidade e Revisões], tint: blue, shape: house, lighten: 70%, name: label("rastreab"))
    let this_width = 7cm
    let rast_lbls = range(1,4+1).map(v => label("rast_" + str(v)))
    blob(rel(-1,-4), align(left)[
        = #bolden[Atualização]
        - Mensal ou bimestral (6.4)
    ], tint: blue, lighten: 80%, width: this_width, name: rast_lbls.at(0))
    blob(rel(0,1), align(left)[
        = #bolden[Alterações]
        - Exigem revisão de quadros e orçamento
    ], tint: blue, lighten: 80%, width: this_width, name: rast_lbls.at(1))
    blob(rel(0,1), align(left)[
        = #bolden[Reajuste]
        - Prestações em adm. (11.2.2.3)
    ], tint: blue, lighten: 80%, width: this_width, name: rast_lbls.at(2))
    blob(rel(0,1), align(left)[
        = #bolden[Memoriais]
        - Quadros V a VIII atualizados
    ], tint: blue, lighten: 80%, width: this_width, name: rast_lbls.at(3))

    blob(rel(0,1), [
        *Observar*:
        - 6.4 e 11.2.2.3
        - Art. 32 (Lei 4.591)
    ], tint: blue, lighten: 80%, name: <rast_obs>)
    edge(<rastreab.west>, <rast_obs.east>, "-|>")

    for i in range(1,4+1) {
        edge(<rastreab.south>, rel(0, -4.5+i), label("rast_"+ str(i) + ".east"), "-|>")
    }

    // --- BIM: Regras ---
    blob(ul(0,-1), [BIM: Regras e Áreas], tint: blue, shape: house, lighten: 70%, name: label("bim_regras"))
    let bim_reg_lbls = range(1,4+1).map(v => label("bim_reg_" + str(v)))
    blob(rel(-1,-4), align(left)[
        = #bolden[Parametrização]
        - NBR 2005 é adaptável a BIM
    ], tint: blue, lighten: 80%, width: this_width, name: bim_reg_lbls.at(0))
    blob(rel(0,1), align(left)[
        = #bolden[Medição]
        - Regras dos itens 5.2 a 5.6
    ], tint: blue, lighten: 80%, width: this_width, name: bim_reg_lbls.at(1))
    blob(rel(0,1), align(left)[
        = #bolden[Mapeamento]
        - Uso de Pset_Area
    ], tint: blue, lighten: 80%, width: this_width, name: bim_reg_lbls.at(2))
    blob(rel(0,1), align(left)[
        = #bolden[Área Equivalente]
        - Coeficientes via parâmetros IFC
    ], tint: blue, lighten: 80%, width: this_width, name: bim_reg_lbls.at(3))

    blob(rel(0,1), [
        *Observar*:
        - 5.2 a 5.7
    ], tint: blue, lighten: 80%, name: <bim_reg_obs>)
    edge(<bim_regras.west>, <bim_reg_obs.east>, "-|>")

    for i in range(1,4+1) {
        edge(<bim_regras.south>, rel(0, -4.5+i), label("bim_reg_"+ str(i) + ".east"), "-|>")
    }

    // --- BIM: Automação ---
    blob(ul(-2,-1), [BIM: Automação], tint: blue, shape: house, lighten: 70%, name: label("bim_auto"))
    let bim_auto_lbls = range(1,4+1).map(v => label("bim_auto_" + str(v)))
    blob(rel(-1,-4), align(left)[
        = #bolden[Extração]
        - Scripts (ex: Dynamo)
    ], tint: blue, lighten: 80%, width: this_width, name: bim_auto_lbls.at(0))
    blob(rel(0,1), align(left)[
        = #bolden[Quadros]
        - Alimenta I, II e IV-B
    ], tint: blue, lighten: 80%, width: this_width, name: bim_auto_lbls.at(1))
    blob(rel(0,1), align(left)[
        = #bolden[Auditoria]
        - Dado nasce do modelo
    ], tint: blue, lighten: 80%, width: this_width, name: bim_auto_lbls.at(2))
    blob(rel(0,1), align(left)[
        = #bolden[Rastreabilidade]
        - Área vinculada ao elemento
    ], tint: blue, lighten: 80%, width: this_width, name: bim_auto_lbls.at(3))

    blob(rel(0,1), [
        *Observar*:
        - Quadros I a IV-B
    ], tint: blue, lighten: 80%, name: <bim_auto_obs>)
    edge(<bim_auto.west>, <bim_auto_obs.east>, "-|>")

    for i in range(1,4+1) {
        edge(<bim_auto.south>, rel(0, -4.5+i), label("bim_auto_"+ str(i) + ".east"), "-|>")
    }
        

    }
)
