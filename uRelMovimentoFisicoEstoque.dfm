�
 TFRMRELATORIOMOVIMENTOFISICOESTOQUE 0�v  TPF0#TfrmRelatorioMovimentoFisicoEstoque"frmRelatorioMovimentoFisicoEstoqueLeft Top BorderIconsbiSystemMenubiHelp BorderStylebsSingleCaption2   Relatório Movimento Físico/Financeiro de EstoqueClientHeight� ClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold OldCreateOrderPositionpoMainFormCenterOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TLabelLabel1LeftTopBWidth<HeightCaption   Mês Inicial  TLabelLabel2Left� TopBWidth4HeightCaption
   Mês Final  TLabelLabel3LeftTopWidthVHeightCaption   Ano Referência  	TComboBoxcmbMesInicioLeftTopUWidth� Height	ItemIndex TabOrder TextJaneiroItems.StringsJaneiro	Fevereiro   MarçoAbrilMaioJunhoJulhoAgostoSetembroOutubroNovembroDezembro   	TComboBoxcmbMesFinalLeft� TopUWidth� Height	ItemIndex TabOrderTextJaneiroItems.StringsJaneiro	Fevereiro   MarçoAbrilMaioJunhoJulhoAgostoSetembroOutubroNovembroDezembro   	TCheckBox
chkProdutoLeftTop}WidthaHeightCaptionProdutoTabOrder  TBitBtnbtnVisualizarLeftaTopWidth� Height+Caption
Visualizar
Glyph.Data
:  6  BM6      6   (                  �  �          ������������YYYYYYYYYYYYYYYYYYYYYYYY���������������������kkk������������������������kkk������������DDDDDDjjj��������������������ﵵ�jjjLLLDDD���III������RRRrqr������������������sssUTT������IIIOOO������LKMKLLKKKKJKKLKLLMMMNNNNQRQRSS������OOOWWW������������������������������������������WWW```������YYZYZZYYZYYZZYZYYZYYZYZZYYZYYZ������```hhh������abbaababbbababbabbbabbbababbbb������hhh���������hijiijiiiiiiiijiiiiiiiiiiiiiii�����񐐐��а�����nnnnnnnnnnnnnnnnnnnnnnnnnnnnnn��ﹹ�������������MMM������������������������MMM������������������___������������������������___������������������iii������������������������iii������������������ttt������������������tttttt���������������������}}}������������������}}}���������������������������������������������������������������TabOrderOnClickbtnVisualizarClick  TRadioGroupRadioGroup1LeftaTop=Width� HeightDCaption   Opções	ItemIndex Items.Strings   Físico
Financeiro TabOrder  	TComboBoxcmbAnoLeftTopWidth� HeightTabOrder  TBitBtnbtnChgOrder1Left�Top� WidthHeightCaption|TabOrderOnClickbtnChgOrder1Click  TJvDBLookupComboDBLookupComboBox2LeftTop� Width�HeightDisplayAllFields		ListStylelsDelimitedLookupField	produtoIDLookupDisplayprodutoID; descricaoLookupFormat%s | %sLookupSource$dmComprasEstoque.dsQryProdRequisicaoParentShowHintShowHint	TabOrderUseRecordCount	  	TADOQueryqryRelMovFisEstoque
ConnectiondmComprasEstoque.conexao
CursorTypectStatic
Parameters SQL.Strings�SELECT  'Janeiro' as 'datainicio', 'Dezembro' as 'dataFinal', '2014' as 'ano',  e.nome as Prefeitura, e.nomeuf as Estado, e.cnpj, e.logo , )p.produtoID, p.descricao as nomeproduto, LCoalesce(sum(ep.entrada),0) as ENTRADA, Coalesce(Sum(ep.saida),0) as SAIDA, "Coalesce(Sum(ep.saldo),0) as SALDOFROM estoqueproduto as ep0join produto as p on p.produtoID =  ep.idprodutojoin entidade as e:join itensentradaproduto ie on ie.idproduto = p.produtoid Fjoin entradaproduto entprod on ie.identradaproduto = entprod.entradaID!group by p.produtoID, p.descricao Left0Top�   TfrxDBDatasetfrxDBRelatorioMovFisEstoqueUserNamefrxDBRelatorioMovFisEstoqueCloseDataSourceFieldAliases.Stringsdatainicio=datainiciodataFinal=dataFinalano=anoPrefeitura=PrefeituraEstado=Estado	cnpj=cnpj	logo=logoprodutoID=produtoIDnomeproduto=nomeprodutoENTRADA=ENTRADASAIDA=SAIDASALDO=SALDO DataSetqryRelMovFisEstoqueBCDToCurrencyLeft8Top0  
TfrxReportfrxRelatorioMovFisEstoqueVersion5.1.5DotMatrixReportIniFile\Software\Fast ReportsPreviewOptions.ButtonspbPrintpbLoadpbSavepbExportpbZoompbFind	pbOutlinepbPageSetuppbToolspbEditpbNavigatorpbExportQuick PreviewOptions.Zoom       ��?PrintOptions.PrinterDefaultPrintOptions.PrintOnSheet ReportOptions.CreateDate  -��_@�@ReportOptions.LastChange �D!�uD�@ScriptLanguagePascalScriptScriptText.Stringsbegin    end. Left8Top� DatasetsDataSetfrxDBRelatorioMovFisEstoqueDataSetNamefrxDBRelatorioMovFisEstoque DataSetfrxEntidadeDataSetNamefrxEntidade  	Variables Style  TfrxDataPageDataHeight       �@Width       �@  TfrxReportPagePage1
PaperWidth       �@PaperHeight      ��@	PaperSize	
LeftMargin       �@RightMargin       �@	TopMargin       �@BottomMargin       �@ TfrxPageHeaderPageHeader1FillTypeftBrushHeight�\��ʾۭ@Top�	�c.�@Widthh��s���@ TfrxPictureView	LogomarcaLeft>�
Y�j�@Top>�
Y�j�@Width�UH�I�׋@Height�j����@HightQualityTransparentTransparentColorclWhite  TfrxMemoViewMemo1Left�����@Top>�
Y�j�@WidthϠ�:�@Height�	�c.�@
Memo.UTF8WSistema de Compras e Estoque   TfrxMemoView!frxDBRelatorioMovFisEstoqueEstadoLeft�����@Top��	K<�L�@Width��� v6�@Height�	�c.�@	DataFieldEstadoDataSetfrxDBRelatorioMovFisEstoqueDataSetNamefrxDBRelatorioMovFisEstoque
Memo.UTF8W&[frxDBRelatorioMovFisEstoque."Estado"]   TfrxMemoView%frxDBRelatorioMovFisEstoquePrefeituraLeft�����@Top���)�D��@Width��K���P�@Height�	�c.�@	DataField
PrefeituraDataSetfrxDBRelatorioMovFisEstoqueDataSetNamefrxDBRelatorioMovFisEstoque
Memo.UTF8W*[frxDBRelatorioMovFisEstoque."Prefeitura"]   TfrxMemoViewfrxDBRelatorioMovFisEstoquecnpjLeft�����@TopE*�-9�@Width6v�ꭁ��@Height�	�c.�@DataSetfrxDBRelatorioMovFisEstoqueDataSetNamefrxDBRelatorioMovFisEstoque
Memo.UTF8W*CNPJ: [frxDBRelatorioMovFisEstoque."cnpj"]   TfrxMemoViewMemo2Left>�
Y�j�@Top2��Y��f�@Width����N��@Height>�
Y�j�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaCenter
Memo.UTF8W   Relatório de Estoque Físico 
ParentFont  TfrxMemoViewperiodoLefts�,&6��@Top>�
Y�j�@Width\���4��@Height�	�c.�@StretchModesmActualHeightFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaRight
Memo.UTF8W   Período de Listagem: 
ParentFont  TfrxMemoViewMemo21Lefts�,&6��@Top�j����@Width\���4��@Height�	�c.�@StretchModesmActualHeight	AutoWidth	Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaRight
Memo.UTF8W}   [frxDBRelatorioMovFisEstoque."datainicio"] à [frxDBRelatorioMovFisEstoque."dataFinal"] / [frxDBRelatorioMovFisEstoque."ano"] 
ParentFontFormats       TfrxColumnHeaderColumnHeader1FillTypeftBrushHeight>�
Y�j�@TopI�L���n�@Widthh��s���@ TfrxLineViewLine1Widthh��s���@ColorclBlack	Frame.TypftTop   TfrxLineViewLine2Top>�
Y�j�@Widthh��s���@ColorclBlack	Frame.TypftTop   TfrxMemoViewMemo3Top�j���� @Width�C�l����@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
Memo.UTF8W   Código/Descrição Produto 
ParentFont  TfrxMemoViewMemo4Lefts�,&6�@Top       �@Width6v�ꭁ��@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaRight
Memo.UTF8WEntrada 
ParentFont  TfrxMemoViewMemo5Left��ǘ��H�@Top�j���� @Width.�&�@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaRight
Memo.UTF8W   Saída 
ParentFont  TfrxMemoViewMemo6Left6v�ꭁ��@Top�j���� @Width���)�D��@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaRight
Memo.UTF8WSaldo 
ParentFont   TfrxMasterDataMasterData1FillTypeftBrushHeight>�
Y�j�@Top���{�J�@Widthh��s���@DataSetfrxDBRelatorioMovFisEstoqueDataSetNamefrxDBRelatorioMovFisEstoqueRowCount  TfrxMemoView$frxDBRelatorioMovFisEstoqueprodutoIDTop�j���� @Width�	�c.�@Height�	�c.�@	DataField	produtoIDDataSetfrxDBRelatorioMovFisEstoqueDataSetNamefrxDBRelatorioMovFisEstoqueFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaRight
Memo.UTF8W)[frxDBRelatorioMovFisEstoque."produtoID"] 
ParentFont  TfrxMemoView&frxDBRelatorioMovFisEstoquenomeprodutoLeft��	K<�L�@Top�j���� @Width�C�l����@Height�	�c.�@	DataFieldnomeprodutoDataSetfrxDBRelatorioMovFisEstoqueDataSetNamefrxDBRelatorioMovFisEstoque
Memo.UTF8W+[frxDBRelatorioMovFisEstoque."nomeproduto"]   TfrxMemoView"frxDBRelatorioMovFisEstoqueENTRADALefts�,&6��@Top�j���� @Width6v�ꭁ��@Height�	�c.�@	DataFieldENTRADADataSetfrxDBRelatorioMovFisEstoqueDataSetNamefrxDBRelatorioMovFisEstoqueDisplayFormat.DecimalSeparator,DisplayFormat.FormatStr%2.3nDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaRight
Memo.UTF8W'[frxDBRelatorioMovFisEstoque."ENTRADA"] 
ParentFont  TfrxMemoView frxDBRelatorioMovFisEstoqueSAIDALeft��ǘ��H�@Top�j���� @Width6v�ꭁ��@Height�	�c.�@	DataFieldSAIDADataSetfrxDBRelatorioMovFisEstoqueDataSetNamefrxDBRelatorioMovFisEstoqueDisplayFormat.DecimalSeparator,DisplayFormat.FormatStr%2.3nDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaRight
Memo.UTF8W%[frxDBRelatorioMovFisEstoque."SAIDA"] 
ParentFont  TfrxMemoView frxDBRelatorioMovFisEstoqueSALDOLeft6v�ꭁ��@Top�j���� @Width6v�ꭁ��@Height�	�c.�@	DataFieldSALDODataSetfrxDBRelatorioMovFisEstoqueDataSetNamefrxDBRelatorioMovFisEstoqueDisplayFormat.DecimalSeparator,DisplayFormat.FormatStr%2.3nDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaRight
Memo.UTF8W%[frxDBRelatorioMovFisEstoque."SALDO"] 
ParentFont   TfrxMasterDataMasterData2FillTypeftBrushHeight>�
Y�j�@Top@j'���@Widthh��s���@DataSetfrxResponsaveisDataSetNamefrxResponsaveisRowCount   
TfrxFooterFooter1FillTypeftBrushHeight�J�h��@Top��4�R��@Widthh��s���@ TfrxLineViewLine3Top�j����@Widthh��s���@ColorclBlack	Frame.TypftTop   TfrxSysMemoViewSysMemo1Leftǀ���C�@Top�j����@Width�C�l����@Height�	�c.�@DisplayFormat.DecimalSeparator,DisplayFormat.FormatStr%2.3nDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaRight
Memo.UTF8W:[SUM(<frxDBRelatorioMovFisEstoque."ENTRADA">,MasterData1)] 
ParentFont  TfrxSysMemoViewSysMemo2Left�ŧ Ϥ�@Top�j����@Width�C�l����@Height�	�c.�@DisplayFormat.DecimalSeparator,DisplayFormat.FormatStr%2.3nDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaRight
Memo.UTF8W8[SUM(<frxDBRelatorioMovFisEstoque."SAIDA">,MasterData1)] 
ParentFont  TfrxSysMemoViewSysMemo3Left`YiR
��@Top�j����@Width�C�l����@Height�	�c.�@DisplayFormat.DecimalSeparator,DisplayFormat.FormatStr%2.3nDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaRight
Memo.UTF8W8[SUM(<frxDBRelatorioMovFisEstoque."SALDO">,MasterData1)] 
ParentFont  TfrxMemoViewfrxEntidaderesp1_nomeLeft>�
Y�j�@TopUގpZ�r�@Width�<I�f���@Height�	�c.�@DataSetfrxEntidadeDataSetNamefrxEntidadeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaCenterHighlight.ApplyFontHighlight.ApplyFrame	Highlight.Font.CharsetDEFAULT_CHARSETHighlight.Font.ColorclRedHighlight.Font.Height�Highlight.Font.NameArialHighlight.Font.Style Highlight.Condition <frxEntidade."resp1_nome"> <> ''Highlight.FillTypeftBrushHighlight.Frame.TypftTop 
Memo.UTF8W[frxEntidade."resp1_nome"] 
ParentFont  TfrxMemoViewfrxEntidaderesp2_nomeLeft�\��ʾ[�@TopUގpZ�r�@Width:#J{�/�@Height�	�c.�@DataSetfrxEntidadeDataSetNamefrxEntidadeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaCenterHighlight.ApplyFontHighlight.ApplyFillHighlight.ApplyFrame	Highlight.Font.CharsetDEFAULT_CHARSETHighlight.Font.ColorclRedHighlight.Font.Height�Highlight.Font.NameArialHighlight.Font.Style Highlight.Condition <frxEntidade."resp2_nome"> <> ''Highlight.FillTypeftBrushHighlight.Frame.TypftTop 
Memo.UTF8W[frxEntidade."resp2_nome"] 
ParentFont  TfrxMemoViewfrxEntidaderesp1_cargoLeft>�
Y�j�@Top�	�c.�@Width�<I�f���@Height�	�c.�@	DataFieldresp1_cargoDataSetfrxEntidadeDataSetNamefrxEntidadeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaCenter
Memo.UTF8W[frxEntidade."resp1_cargo"] 
ParentFont  TfrxMemoViewfrxEntidaderesp2_cargoLeft�\��ʾ[�@Top�	�c.�@Width:#J{�/�@Height�	�c.�@	DataFieldresp2_cargoDataSetfrxEntidadeDataSetNamefrxEntidadeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaCenter
Memo.UTF8W[frxEntidade."resp2_cargo"] 
ParentFont   TfrxMemoViewPageLeft����e��@Width6v�ꭁ��@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaRight
Memo.UTF8W[Page#] 
ParentFont    TfrxPDFExportfrxPDFExport1UseFileCache	ShowProgress	OverwritePromptDataOnlyPrintOptimizedOutline
BackgroundHTMLTags	Quality_TransparencyAuthor
FastReportSubjectFastReport PDF exportProtectionFlagsePrinteModifyeCopyeAnnot HideToolbarHideMenubarHideWindowUI	FitWindowCenterWindowPrintScalingPdfALeftxTop�   TfrxRTFExportfrxRTFExport1UseFileCache	ShowProgress	OverwritePromptDataOnlyPictureTypegpPNGWysiwyg	Creator
FastReportSuppressPageHeadersFootersHeaderFooterModehfTextAutoSizeLeft�Top�   	TADOQueryqryRelMovFinanEstoque
ConnectiondmComprasEstoque.conexao
CursorTypectStatic
Parameters SQL.Strings�SELECT 'Janeiro' as 'datainicio', 'Dezembro' as 'dataFinal', '2014' as 'ano', e.nome as Prefeitura, e.nomeuf as Estado, e.cnpj, e.logo , (p.produtoID, p.descricao as nomeproduto,(Coalesce(sum(ep.entrada),0) * ((SELECT avg(precomedio) FROM precomedio !  WHERE idproduto = p.produtoid)) as ENTRADA, E(Coalesce(Sum(ep.saida),0) * (SELECT avg(precomedio) FROM precomedio -  WHERE idproduto = p.produtoid) ) as SAIDA, E(Coalesce(Sum(ep.saldo),0) * (SELECT avg(precomedio) FROM precomedio +  WHERE idproduto = p.produtoid))  as SALDOFROM estoqueproduto as ep0join produto as p on p.produtoID =  ep.idprodutojoin entidade as eWHERE ep.mes between 1 and 12!group by p.produtoID, p.descricao Left� Top�   TfrxDBDatasetfrxDBRelatorioFinanceiroEstoqueUserNamefrxDBRelatorioFinanceiroEstoqueCloseDataSourceFieldAliases.Stringsdatainicio=datainiciodataFinal=dataFinalano=anoPrefeitura=PrefeituraEstado=Estado	cnpj=cnpj	logo=logoprodutoID=produtoIDnomeproduto=nomeprodutoENTRADA=ENTRADASAIDA=SAIDASALDO=SALDO DataSetqryRelMovFinanEstoqueBCDToCurrencyLeft� Top=  
TfrxReportfrxRelatorioFinanceiroEstoqueVersion5.1.5DotMatrixReportIniFile\Software\Fast ReportsPreviewOptions.ButtonspbPrintpbLoadpbSavepbExportpbZoompbFind	pbOutlinepbPageSetuppbToolspbEditpbNavigatorpbExportQuick PreviewOptions.Zoom       ��?PrintOptions.PrinterDefaultPrintOptions.PrintOnSheet ReportOptions.CreateDate  -��_@�@ReportOptions.LastChange h�+�uD�@ScriptLanguagePascalScriptScriptText.Stringsbegin    end. Left� Top� DatasetsDataSetfrxDBRelatorioFinanceiroEstoqueDataSetNamefrxDBRelatorioFinanceiroEstoque DataSetfrxDescontosDataSetNamefrxDescontos DataSetfrxEntidadeDataSetNamefrxEntidade  	Variables Style  TfrxDataPageDataHeight       �@Width       �@  TfrxReportPagePage1
PaperWidth       �@PaperHeight      ��@	PaperSize	
LeftMargin       �@RightMargin       �@	TopMargin       �@BottomMargin       �@ TfrxPageHeaderPageHeader1FillTypeftBrushHeight�\��ʾۭ@Top�	�c.�@Widthh��s���@ TfrxPictureView	LogomarcaLeft>�
Y�j�@Top>�
Y�j�@Width�UH�I�׋@Height�j����@HightQualityTransparentTransparentColorclWhite  TfrxMemoViewMemo1Left�����@Top>�
Y�j�@WidthϠ�:�@Height�	�c.�@
Memo.UTF8WSistema de Compras e Estoque   TfrxMemoViewMemo2Left>�
Y�j�@Top2��Y��f�@Width����N��@Height>�
Y�j�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaCenter
Memo.UTF8W!   Relatório de Estoque Financeiro  
ParentFont  TfrxMemoView#frxDBRelatorioFinanceiroEstoquecnpjLeft�����@TopE*�-9�@Width6v�ꭁ��@Height�	�c.�@DataSetfrxDBRelatorioFinanceiroEstoqueDataSetNamefrxDBRelatorioFinanceiroEstoque
Memo.UTF8W.CNPJ: [frxDBRelatorioFinanceiroEstoque."cnpj"]   TfrxMemoView%frxDBRelatorioFinanceiroEstoqueEstadoLeft�����@Top��	K<�L�@Width��K���P�@Height�	�c.�@	DataFieldEstadoDataSetfrxDBRelatorioFinanceiroEstoqueDataSetNamefrxDBRelatorioFinanceiroEstoqueFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
Memo.UTF8W*[frxDBRelatorioFinanceiroEstoque."Estado"] 
ParentFont  TfrxMemoView)frxDBRelatorioFinanceiroEstoquePrefeituraLeft�����@Top���)�D��@Width��K���P�@Height�	�c.�@	DataField
PrefeituraDataSetfrxDBRelatorioFinanceiroEstoqueDataSetNamefrxDBRelatorioFinanceiroEstoqueFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
Memo.UTF8W.[frxDBRelatorioFinanceiroEstoque."Prefeitura"] 
ParentFont  TfrxMemoViewdataRelLeftǀ���C�@Top       �@Width2��Y��f�@Height�j����@StretchModesmActualHeight	AutoWidth	Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaRight
Memo.UTF8W   Período de Listagem:�   [frxDBRelatorioFinanceiroEstoque."datainicio"] à [frxDBRelatorioFinanceiroEstoque."dataFinal"] / [frxDBRelatorioFinanceiroEstoque."ano"] 
ParentFont   TfrxColumnHeaderColumnHeader1FillTypeftBrushHeight>�
Y�j�@TopI�L���n�@Widthh��s���@ TfrxLineViewLine1Widthh��s���@ColorclBlack	Frame.TypftTop   TfrxLineViewLine2Top>�
Y�j�@Widthh��s���@ColorclBlack	Frame.TypftTop   TfrxMemoViewMemo3Top�j���� @Width�C�l����@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
Memo.UTF8W   Código/Descrição Produto 
ParentFont  TfrxMemoViewMemo4Left��� v��@Top�j���� @Width6v�ꭁ��@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaCenter
Memo.UTF8WEntrada 
ParentFont  TfrxMemoViewMemo5LeftX��0_^,�@Top�j���� @Width.�&�@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaCenter
Memo.UTF8W   Saída 
ParentFont  TfrxMemoViewMemo6Left�gyܝ˞@Top�j���� @Width���)�D��@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaCenter
Memo.UTF8WSaldo 
ParentFont   TfrxMasterDataMasterData1FillTypeftBrushHeight>�
Y�j�@Top���{�J�@Widthh��s���@DataSetfrxDBRelatorioFinanceiroEstoqueDataSetNamefrxDBRelatorioFinanceiroEstoqueRowCount 	Stretched	 TfrxMemoView(frxDBRelatorioFinanceiroEstoqueprodutoIDLeft�j���� @Top�j���� @Width�	�c.�@Height�	�c.�@StretchModesmActualHeight	DataField	produtoIDDataSetfrxDBRelatorioFinanceiroEstoqueDataSetNamefrxDBRelatorioFinanceiroEstoqueFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaRight
Memo.UTF8W-[frxDBRelatorioFinanceiroEstoque."produtoID"] 
ParentFont  TfrxMemoView*frxDBRelatorioFinanceiroEstoquenomeprodutoLeft>�
Y�j�@Top�j���� @Width�C�l����@Height�	�c.�@StretchModesmActualHeight	DataFieldnomeprodutoDataSetfrxDBRelatorioFinanceiroEstoqueDataSetNamefrxDBRelatorioFinanceiroEstoqueFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
Memo.UTF8W/[frxDBRelatorioFinanceiroEstoque."nomeproduto"] 
ParentFont  TfrxMemoView&frxDBRelatorioFinanceiroEstoqueENTRADALeft�lV}�R�@Top�j���� @Width��	K<�L�@Height�	�c.�@StretchModesmActualHeightDataSetfrxDBRelatorioFinanceiroEstoqueDataSetNamefrxDBRelatorioFinanceiroEstoqueDisplayFormat.DecimalSeparator,DisplayFormat.FormatStr%2.2mDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaRight
Memo.UTF8W+[frxDBRelatorioFinanceiroEstoque."ENTRADA"] 
ParentFont  TfrxMemoView$frxDBRelatorioFinanceiroEstoqueSAIDALeft�ŧ �d�@Top�j���� @Width�C�l����@Height�	�c.�@StretchModesmActualHeight	DataFieldSAIDADataSetfrxDBRelatorioFinanceiroEstoqueDataSetNamefrxDBRelatorioFinanceiroEstoqueDisplayFormat.DecimalSeparator,DisplayFormat.FormatStr%2.2mDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaRight
Memo.UTF8W)[frxDBRelatorioFinanceiroEstoque."SAIDA"] 
ParentFont  TfrxMemoView$frxDBRelatorioFinanceiroEstoqueSALDOLeft�JY�8��@Top�j���� @Width�C�l����@Height�	�c.�@StretchModesmActualHeight	DataFieldSALDODataSetfrxDBRelatorioFinanceiroEstoqueDataSetNamefrxDBRelatorioFinanceiroEstoqueDisplayFormat.DecimalSeparator,DisplayFormat.FormatStr%2.2mDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaRight
Memo.UTF8W)[frxDBRelatorioFinanceiroEstoque."SALDO"] 
ParentFont   TfrxMasterDataMasterData2FillTypeftBrushHeight�j���@Top@j'���@Widthh��s���@DataSetfrxDescontosDataSetNamefrxDescontosRowCount  TfrxMemoView#frxDescontosvaloracrescimodesconto1LeftM�O����@Top�9@0G���?Width�\��ʾۭ@Height�j���� @	DataFieldvaloracrescimodescontoDataSetfrxDescontosDataSetNamefrxDescontos
Memo.UTF8W'[frxDescontos."valoracrescimodesconto"]    
TfrxFooterFooter1FillTypeftBrushHeight����W��@Top�	K<�l2�@Widthh��s���@ TfrxLineViewLine3Widthh��s���@ColorclBlack	Frame.TypftTop   TfrxSysMemoViewSysMemo1Left�c�]K�_�@Width��� v6�@Height�	�c.�@StretchModesmActualHeightDisplayFormat.DecimalSeparator,DisplayFormat.FormatStr%2.2mDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaRight
Memo.UTF8Wz[SUM(<frxDBRelatorioFinanceiroEstoque."ENTRADA">,MasterData1) - SUM(<frxDescontos."valoracrescimodesconto">,MasterData2)]  
ParentFont  TfrxSysMemoViewSysMemo2Left��ǘ����@Width�C�l����@Height�	�c.�@StretchModesmActualHeightDisplayFormat.DecimalSeparator,DisplayFormat.FormatStr%2.2mDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaRight
Memo.UTF8Wz[SUM(<frxDBRelatorioFinanceiroEstoque."SAIDA">,MasterData1)  - SUM(<frxDescontos."valoracrescimodesconto">,MasterData2) ]  
ParentFont  TfrxSysMemoViewSysMemo3Left��� v6�@Top>�
Y�j�@Width�C�l����@Height�	�c.�@VisibleStretchModesmActualHeightDisplayFormat.DecimalSeparator,DisplayFormat.FormatStr%2.2mDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaRight
Memo.UTF8Wx[SUM(<frxDBRelatorioFinanceiroEstoque."SALDO">,MasterData1) - SUM(<frxDescontos."valoracrescimodesconto">,MasterData2)]  
ParentFont  TfrxMemoViewMemo7Left�Ws�`���?Width���)�D��@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
Memo.UTF8W
Descontos: 
ParentFont  TfrxMemoViewMemo8Left6v�ꭁ��@Width�C�l����@Height�	�c.�@DisplayFormat.FormatStr%2.2fDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
Memo.UTF8W=R$ [SUM(<frxDescontos."valoracrescimodesconto">,MasterData2)] 
ParentFont  TfrxMemoViewMemo9Left�JY�8��@Width�C�l����@Height�	�c.�@DisplayFormat.FormatStrR$ %2.2nDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaRightHighlight.Font.CharsetDEFAULT_CHARSETHighlight.Font.ColorclRedHighlight.Font.Height�Highlight.Font.NameArialHighlight.Font.Style Highlight.Condition|SUM(<frxDBRelatorioFinanceiroEstoque."SALDO">,MasterData1) - SUM(<frxDescontos."valoracrescimodesconto">,MasterData2) 
 < 0Highlight.FillTypeftBrushHighlight.Visible
Memo.UTF8Wx[SUM(<frxDBRelatorioFinanceiroEstoque."SALDO">,MasterData1) - SUM(<frxDescontos."valoracrescimodesconto">,MasterData2)]  
ParentFont  TfrxMemoViewMemo10Left�JY�8��@Width�C�l����@Height�	�c.�@DisplayFormat.FormatStrR$ %2.2nDisplayFormat.Kind	fkNumericFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaRight
Memo.UTF8W0,00 
ParentFont
Highlights	ApplyFontFont.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameArial
Font.Style 	ConditionMemo9.Value > 0FillTypeftBrushVisible Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 	ConditionMemo9.Value < 0FillTypeftBrush    TfrxMemoViewfrxEntidaderesp1_nomeLeft�	�c.�@Top��ǘ��H�@Width�<I�f���@Height�	�c.�@DataSetfrxEntidadeDataSetNamefrxEntidadeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaCenterHighlight.ApplyFontHighlight.ApplyFrame	Highlight.Font.CharsetDEFAULT_CHARSETHighlight.Font.ColorclRedHighlight.Font.Height�Highlight.Font.NameArialHighlight.Font.Style Highlight.Condition <frxEntidade."resp1_nome"> <> ''Highlight.FillTypeftBrushHighlight.Frame.TypftTop 
Memo.UTF8W[frxEntidade."resp1_nome"] 
ParentFont  TfrxMemoViewfrxEntidaderesp2_nomeLeft@j'�w�@Top��ǘ��H�@Width:#J{�/�@Height�	�c.�@DataSetfrxEntidadeDataSetNamefrxEntidadeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaCenterHighlight.ApplyFontHighlight.ApplyFillHighlight.ApplyFrame	Highlight.Font.CharsetDEFAULT_CHARSETHighlight.Font.ColorclRedHighlight.Font.Height�Highlight.Font.NameArialHighlight.Font.Style Highlight.Condition <frxEntidade."resp2_nome"> <> ''Highlight.FillTypeftBrushHighlight.Frame.TypftTop 
Memo.UTF8W[frxEntidade."resp2_nome"] 
ParentFont  TfrxMemoViewfrxEntidaderesp1_cargoLeft�	�c.�@Top6v�ꭁ��@Width�<I�f���@Height�	�c.�@	DataFieldresp1_cargoDataSetfrxEntidadeDataSetNamefrxEntidadeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaCenter
Memo.UTF8W[frxEntidade."resp1_cargo"] 
ParentFont  TfrxMemoViewfrxEntidaderesp2_cargoLeft@j'�w�@Top6v�ꭁ��@Width:#J{�/�@Height�	�c.�@	DataFieldresp2_cargoDataSetfrxEntidadeDataSetNamefrxEntidadeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style HAlignhaCenter
Memo.UTF8W[frxEntidade."resp2_cargo"] 
ParentFont   TfrxMemoViewPageLeft����e��@Width6v�ꭁ��@Height�	�c.�@Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold HAlignhaRight
Memo.UTF8W[Page#] 
ParentFont    	TADOQueryqryEntradaProdutoActive	
ConnectiondmComprasEstoque.conexao
CursorTypectStatic
Parameters SQL.Strings select ep.valoracrescimodescontofrom entradaproduto ep:where ep.dataentrada between '2014-01-01' and '2014-12-28' LeftTop  TfrxDBDatasetfrxDescontosUserNamefrxDescontosCloseDataSourceDataSetqryEntradaProdutoBCDToCurrencyLeftpTop�   	TADOQueryqryResponsaveisActive	
ConnectiondmComprasEstoque.conexao
CursorTypectStatic
Parameters SQL.Strings;select distinct p.nome, p.funcao, p.cpf from almoxarifado ajoin pessoas pTon a.idresponsavelautorizacao = p.pessoasID or a.idresponsaveldespacho = p.pessoasID     Left Top   TfrxDBDatasetfrxResponsaveisUserNamefrxResponsaveisCloseDataSourceFieldAliases.Strings	nome=nomefuncao=funcaocpf=cpf DataSetqryResponsaveisBCDToCurrencyLeftxTop   TfrxDBDatasetfrxEntidadeUserNamefrxEntidadeCloseDataSourceFieldAliases.Strings	nome=nomelogradouro=logradouronumero=numerocomplemento=complementobairro=bairrocidade=cidadeuf=ufnomeuf=nomeufcep=ceptelefone=telefonefax=fax	cnpj=cnpjslogan=sloganfebraban=febraban	logo=logorodape1=rodape1rodape2=rodape2mestrabalho=mestrabalhoserialentidade=serialentidadeserialvalidade=serialvalidademesExercicio=mesExercicioanoExercicio=anoExercicioresp1_nome=resp1_nomeresp1_cic=resp1_cicresp1_cargo=resp1_cargoresp2_nome=resp2_nomeresp2_cic=resp2_cicresp2_cargo=resp2_cargoresp3_nome=resp3_nomeresp3_cic=resp3_cicresp3_cargo=resp3_cargo DataSetqryEntidadeBCDToCurrencyLeft�Top=  	TADOQueryqryEntidadeActive	
ConnectiondmComprasEstoque.conexao
CursorTypectStatic
Parameters SQL.StringsSELECT * from entidade LeftPTop@   