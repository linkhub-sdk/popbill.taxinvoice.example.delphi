object frmExample: TfrmExample
  Left = 501
  Top = 109
  Caption = 'Linkhub '#54045#48716' '#51204#51088#49464#44552#44228#49328#49436'  SDK Examples'
  ClientHeight = 824
  ClientWidth = 1304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 16
    Top = 12
    Width = 129
    Height = 13
    AutoSize = False
    Caption = #54045#48716#54924#50896' '#49324#50629#51088#48264#54840' : '
  end
  object Label4: TLabel
    Left = 304
    Top = 12
    Width = 81
    Height = 13
    AutoSize = False
    Caption = #54045#48716#50500#51060#46356' : '
  end
  object Label8: TLabel
    Left = 872
    Top = 14
    Width = 51
    Height = 13
    AutoSize = False
    Caption = 'URL :'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 224
    Width = 1273
    Height = 577
    Caption = #51204#51088#49464#44552#44228#49328#49436' '#44288#47144' API'
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 30
      Width = 92
      Height = 13
      Caption = #47928#49436#48264#54840'(MgtKey) :'
    end
    object GroupBox20: TGroupBox
      Left = 8
      Top = 64
      Width = 488
      Height = 273
      Caption = #51221#48156#54665' '#54532#47196#49464#49828
      TabOrder = 18
    end
    object GroupBox2: TGroupBox
      Left = 234
      Top = 96
      Width = 254
      Height = 193
      Caption = #51076#49884#51200#51109' '#48156#54665' '#54532#47196#49464#49828
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Shape5: TShape
        Left = 69
        Top = 64
        Width = 2
        Height = 81
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape11: TShape
        Left = 296
        Top = 45
        Width = 1
        Height = 100
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape2: TShape
        Left = 47
        Top = 48
        Width = 1
        Height = 97
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape9: TShape
        Left = 53
        Top = 140
        Width = 148
        Height = 2
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape7: TShape
        Left = 263
        Top = 75
        Width = 1
        Height = 94
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape1: TShape
        Left = 16
        Top = 32
        Width = 225
        Height = 41
        Brush.Color = clAppWorkSpace
        Pen.Style = psClear
      end
      object Label6: TLabel
        Left = 24
        Top = 48
        Width = 52
        Height = 12
        Caption = #51076#49884#51200#51109
        Color = clAppWorkSpace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object btnRegister: TButton
        Left = 96
        Top = 42
        Width = 49
        Height = 25
        Caption = #46321#47197
        TabOrder = 0
        OnClick = btnRegisterClick
      end
      object btnUpdate: TButton
        Left = 160
        Top = 42
        Width = 49
        Height = 25
        Caption = #49688#51221
        TabOrder = 1
        OnClick = btnUpdateClick
      end
      object btnCancelIssue_sub: TButton
        Left = 40
        Top = 128
        Width = 65
        Height = 27
        Caption = #48156#54665#52712#49548
        TabOrder = 2
        OnClick = btnCancelIssue_subClick
      end
      object btnDelete_sub: TButton
        Left = 156
        Top = 128
        Width = 66
        Height = 26
        Caption = #49325#51228
        TabOrder = 3
        OnClick = btnDelete_subClick
      end
      object btnIssue: TButton
        Left = 40
        Top = 82
        Width = 64
        Height = 26
        Caption = #48156#54665
        TabOrder = 4
        OnClick = btnIssueClick
      end
    end
    object GroupBox21: TGroupBox
      Left = 504
      Top = 64
      Width = 577
      Height = 273
      Caption = #50669#48156#54665' '#54532#47196#49464#49828
      TabOrder = 19
    end
    object GroupBox19: TGroupBox
      Left = 513
      Top = 96
      Width = 296
      Height = 193
      Caption = '('#44428#51109') '#51593#49884#50836#52397' '#54532#47196#49464#49828
      TabOrder = 17
      object Shape22: TShape
        Left = 96
        Top = 152
        Width = 145
        Height = 0
      end
      object Shape24: TShape
        Left = 104
        Top = 152
        Width = 121
        Height = 1
      end
      object Shape25: TShape
        Left = 240
        Top = 40
        Width = 1
        Height = 113
      end
      object Shape26: TShape
        Left = 72
        Top = 72
        Width = 89
        Height = 1
      end
      object Shape27: TShape
        Left = 160
        Top = 72
        Width = 1
        Height = 81
      end
      object Shape28: TShape
        Left = 72
        Top = 72
        Width = 1
        Height = 88
      end
      object Shape31: TShape
        Left = 112
        Top = 48
        Width = 1
        Height = 24
      end
      object Shape30: TShape
        Left = 16
        Top = 24
        Width = 265
        Height = 33
        Brush.Color = clAppWorkSpace
        Pen.Style = psClear
      end
      object btnIssue_reverse: TButton
        Left = 39
        Top = 88
        Width = 66
        Height = 25
        Caption = #48156#54665
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnIssue_reverseClick
      end
      object btnCancelIssue_reverse: TButton
        Left = 40
        Top = 144
        Width = 66
        Height = 26
        Caption = #48156#54665#52712#49548
        TabOrder = 1
        OnClick = btnCancelIssue_reverseClick
      end
      object btnCancelRequest: TButton
        Left = 208
        Top = 88
        Width = 65
        Height = 25
        Caption = #50836#52397#52712#49548
        TabOrder = 2
        OnClick = btnCancelRequestClick
      end
      object btnRefuse: TButton
        Left = 128
        Top = 88
        Width = 65
        Height = 25
        Caption = #44144#48512
        TabOrder = 3
        OnClick = btnRefuseClick
      end
      object btnDelete_reverse: TButton
        Left = 208
        Top = 144
        Width = 66
        Height = 26
        Caption = #49325#51228
        TabOrder = 4
        OnClick = btnDelete_reverseClick
      end
      object StaticText1: TStaticText
        Left = 40
        Top = 34
        Width = 56
        Height = 16
        Caption = #51593#49884#50836#52397
        Color = clAppWorkSpace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 5
      end
    end
    object GroupBox15: TGroupBox
      Left = 16
      Top = 96
      Width = 209
      Height = 193
      Caption = '('#44428#51109') '#51593#49884#48156#54665' '#54532#47196#49464#49828
      TabOrder = 14
      DesignSize = (
        209
        193)
      object Shape19: TShape
        Left = 49
        Top = 56
        Width = 1
        Height = 65
        Anchors = [akTop]
      end
      object Shape20: TShape
        Left = 96
        Top = 115
        Width = 65
        Height = 1
      end
      object Shape21: TShape
        Left = 16
        Top = 32
        Width = 179
        Height = 41
        Brush.Color = clAppWorkSpace
        Pen.Style = psClear
      end
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 348
      Width = 153
      Height = 212
      Caption = #52392#48512#54028#51068
      TabOrder = 1
      object Label2: TLabel
        Left = 12
        Top = 84
        Width = 89
        Height = 13
        AutoSize = False
        Caption = #49325#51228#54624' '#54028#51068'ID:'
      end
      object btnGetFileList: TButton
        Left = 12
        Top = 53
        Width = 128
        Height = 25
        Caption = #52392#48512#54028#51068' '#47785#47197
        TabOrder = 0
        OnClick = btnGetFileListClick
      end
      object btnAttachFile: TButton
        Left = 12
        Top = 24
        Width = 128
        Height = 25
        Caption = #54028#51068' '#52392#48512
        TabOrder = 1
        OnClick = btnAttachFileClick
      end
      object btnDeleteFile: TButton
        Left = 12
        Top = 124
        Width = 128
        Height = 25
        Caption = #52392#48512#54028#51068' '#49325#51228
        TabOrder = 2
        OnClick = btnDeleteFileClick
      end
      object tbFileIndexID: TEdit
        Left = 12
        Top = 98
        Width = 128
        Height = 21
        ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
        TabOrder = 3
      end
    end
    object GroupBox5: TGroupBox
      Left = 183
      Top = 348
      Width = 162
      Height = 212
      Caption = #47928#49436' '#51221#48372
      TabOrder = 2
      object btnGetDetailInfo: TButton
        Left = 12
        Top = 81
        Width = 135
        Height = 25
        Caption = #49345#49464#51221#48372' '#54869#51064
        TabOrder = 0
        OnClick = btnGetDetailInfoClick
      end
      object btnGetLogs: TButton
        Left = 12
        Top = 165
        Width = 135
        Height = 25
        Caption = #49345#53468' '#48320#44221#51060#47141' '#54869#51064
        TabOrder = 1
        OnClick = btnGetLogsClick
      end
      object btnGetInfo: TButton
        Left = 12
        Top = 24
        Width = 135
        Height = 25
        Caption = #49345#53468' '#54869#51064
        TabOrder = 2
        OnClick = btnGetInfoClick
      end
      object btnGetInfos: TButton
        Left = 12
        Top = 54
        Width = 135
        Height = 25
        Caption = #49345#53468' '#45824#47049' '#54869#51064
        TabOrder = 3
        OnClick = btnGetInfosClick
      end
      object btnSearch: TButton
        Left = 12
        Top = 136
        Width = 135
        Height = 25
        Caption = #47785#47197' '#51312#54924
        TabOrder = 4
        OnClick = btnSearchClick
      end
      object btnGetXML: TButton
        Left = 12
        Top = 109
        Width = 135
        Height = 25
        Caption = #49345#49464#51221#48372' '#54869#51064' - XML'
        TabOrder = 5
        OnClick = btnGetXMLClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 901
      Top = 348
      Width = 350
      Height = 212
      Caption = #48512#44032#44592#45733
      TabOrder = 3
      object btnSendEmail: TButton
        Left = 12
        Top = 24
        Width = 154
        Height = 25
        Caption = #51060#47700#51068' '#51204#49569
        TabOrder = 0
        OnClick = btnSendEmailClick
      end
      object btnSendSMS: TButton
        Left = 12
        Top = 54
        Width = 154
        Height = 25
        Caption = #47928#51088' '#51204#49569
        TabOrder = 1
        OnClick = btnSendSMSClick
      end
      object btnSendFax: TButton
        Left = 12
        Top = 83
        Width = 154
        Height = 25
        Caption = #54057#49828' '#51204#49569
        TabOrder = 2
        OnClick = btnSendFaxClick
      end
      object btnDetachStatement: TButton
        Left = 12
        Top = 142
        Width = 154
        Height = 25
        Caption = #51204#51088#47749#49464#49436' '#52392#48512#54644#51228
        TabOrder = 3
        OnClick = btnDetachStatementClick
      end
      object btnAttachStatement: TButton
        Left = 12
        Top = 113
        Width = 154
        Height = 25
        Caption = #51204#51088#47749#49464#49436' '#52392#48512
        TabOrder = 4
        OnClick = btnAttachStatementClick
      end
      object btnAssignMgtKey: TButton
        Left = 172
        Top = 24
        Width = 165
        Height = 25
        Caption = #47928#49436#48264#54840' '#54624#45817
        TabOrder = 5
        OnClick = btnAssignMgtKeyClick
      end
      object btnListEmailConfig: TButton
        Left = 172
        Top = 54
        Width = 165
        Height = 25
        Caption = #50508#47548#47700#51068' '#51204#49569#47785#47197' '#51312#54924
        TabOrder = 6
        OnClick = btnListEmailConfigClick
      end
      object btnUpdateEmailConfig: TButton
        Left = 172
        Top = 83
        Width = 165
        Height = 25
        Caption = #50508#47548#47700#51068' '#51204#49569#49444#51221' '#49688#51221
        TabOrder = 7
        OnClick = btnUpdateEmailConfigClick
      end
      object btnGetSendToNTSConfig: TButton
        Left = 173
        Top = 112
        Width = 165
        Height = 25
        Caption = #44397#49464#52397' '#51204#49569' '#49444#51221' '#54869#51064
        TabOrder = 8
        OnClick = btnGetSendToNTSConfigClick
      end
    end
    object tbMgtKey: TEdit
      Left = 244
      Top = 26
      Width = 205
      Height = 21
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      TabOrder = 4
    end
    object btnCheckMgtKeyInUse: TButton
      Left = 457
      Top = 18
      Width = 161
      Height = 31
      Caption = #47928#49436#48264#54840' '#49324#50857#50668#48512' '#54869#51064
      TabOrder = 5
      OnClick = btnCheckMgtKeyInUseClick
    end
    object GroupBox10: TGroupBox
      Left = 357
      Top = 348
      Width = 152
      Height = 212
      Caption = #44592#53440'  URL'
      TabOrder = 6
      object btnGetURL1: TButton
        Left = 12
        Top = 24
        Width = 127
        Height = 25
        Caption = #51076#49884'('#50672#46041') '#47928#49436#54632
        TabOrder = 0
        OnClick = btnGetURL1Click
      end
      object btnGetURL2: TButton
        Left = 12
        Top = 108
        Width = 127
        Height = 25
        Caption = #47588#52636' '#47928#49436#54632
        TabOrder = 1
        OnClick = btnGetURL2Click
      end
      object btnGetURL3: TButton
        Left = 12
        Top = 135
        Width = 127
        Height = 25
        Caption = #47588#51077' '#47928#49436#54632
        TabOrder = 2
        OnClick = btnGetURL3Click
      end
      object btnGetURL4: TButton
        Left = 12
        Top = 164
        Width = 127
        Height = 25
        Caption = #47588#52636' '#47928#49436#51089#49457
        TabOrder = 3
        OnClick = btnGetURL4Click
      end
      object btnGetURL5: TButton
        Left = 12
        Top = 52
        Width = 127
        Height = 25
        Caption = #47588#52636' '#48156#54665' '#45824#44592#54632
        TabOrder = 4
        OnClick = btnGetURL5Click
      end
      object btnGetURL6: TButton
        Left = 12
        Top = 80
        Width = 127
        Height = 25
        Caption = #47588#51077' '#48156#54665' '#45824#44592#54632
        TabOrder = 5
        OnClick = btnGetURL6Click
      end
    end
    object cbMgtKeyType: TComboBox
      Left = 168
      Top = 26
      Width = 73
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 7
      Text = 'SELL'
      OnChange = cbMgtKeyTypeChange
      Items.Strings = (
        'SELL'
        'BUY'
        'TRUSTEE')
    end
    object GroupBox13: TGroupBox
      Left = 813
      Top = 96
      Width = 257
      Height = 193
      Caption = #51076#49884#51200#51109' '#50669#48156#54665' '#54532#47196#49464#49828
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      object Shape15: TShape
        Left = 191
        Top = 88
        Width = 2
        Height = 81
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape16: TShape
        Left = 53
        Top = 48
        Width = 2
        Height = 113
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape18: TShape
        Left = 53
        Top = 164
        Width = 140
        Height = 2
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape23: TShape
        Left = 16
        Top = 24
        Width = 225
        Height = 35
        Brush.Color = clAppWorkSpace
        Pen.Style = psClear
      end
      object Label5: TLabel
        Left = 24
        Top = 34
        Width = 52
        Height = 12
        Caption = #51076#49884#51200#51109
        Color = clAppWorkSpace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Shape14: TShape
        Left = 123
        Top = 89
        Width = 2
        Height = 77
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape17: TShape
        Left = 116
        Top = 84
        Width = 53
        Height = 2
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object btnRegister_reverse: TButton
        Left = 96
        Top = 28
        Width = 49
        Height = 27
        Caption = #46321#47197
        TabOrder = 0
        OnClick = btnRegister_reverseClick
      end
      object btnUpdate_reverse: TButton
        Left = 152
        Top = 28
        Width = 49
        Height = 27
        Caption = #49688#51221
        TabOrder = 1
        OnClick = btnUpdate_reverseClick
      end
      object btnCancelIssue_reverse_sub: TButton
        Left = 24
        Top = 152
        Width = 60
        Height = 27
        Caption = #48156#54665#52712#49548
        TabOrder = 2
        OnClick = btnCancelIssue_subClick
      end
      object btnDelete_reverse_sub: TButton
        Left = 164
        Top = 152
        Width = 65
        Height = 27
        Caption = #49325#51228
        TabOrder = 3
        OnClick = btnDelete_subClick
      end
      object btnIssue_reverse_sub: TButton
        Left = 24
        Top = 114
        Width = 60
        Height = 27
        Caption = #48156#54665
        TabOrder = 4
        OnClick = btnIssueClick
      end
      object btnCancelRequest_sub: TButton
        Left = 164
        Top = 74
        Width = 65
        Height = 27
        Caption = #50836#52397#52712#49548
        TabOrder = 5
        OnClick = btnCancelRequest_subClick
      end
      object btnRequest: TButton
        Left = 24
        Top = 74
        Width = 121
        Height = 27
        Caption = #48156#54665#50836#52397
        TabOrder = 6
        OnClick = btnRequestClick
      end
      object btnRefuse_sub2: TButton
        Left = 96
        Top = 114
        Width = 60
        Height = 27
        Caption = #44144#48512
        TabOrder = 7
        OnClick = btnRefuse_sub2Click
      end
    end
    object btnGetEmailPublicKey: TButton
      Left = 1080
      Top = 24
      Width = 177
      Height = 25
      Caption = #50976#53685#49324#50629#51088' '#47700#51068' '#47785#47197' '#54869#51064
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = btnGetEmailPublicKeyClick
    end
    object btnSendToNTS: TButton
      Left = 96
      Top = 296
      Width = 185
      Height = 33
      Caption = #44397#49464#52397' '#51593#49884#51204#49569
      TabOrder = 10
      OnClick = btnSendToNTSClick
    end
    object btnRegistIssue: TButton
      Left = 44
      Top = 137
      Width = 76
      Height = 26
      Caption = #51593#49884#48156#54665
      TabOrder = 11
      OnClick = btnRegistIssueClick
    end
    object btnCancelIssue: TButton
      Left = 44
      Top = 200
      Width = 73
      Height = 27
      Caption = #48156#54665#52712#49548
      TabOrder = 12
      OnClick = btnCancelIssueClick
    end
    object btnDelete: TButton
      Left = 138
      Top = 200
      Width = 65
      Height = 25
      Caption = #49325#51228
      TabOrder = 13
      OnClick = btnDeleteClick
    end
    object GroupBox7: TGroupBox
      Left = 519
      Top = 348
      Width = 372
      Height = 212
      Caption = #49464#44552#44228#49328#49436' '#48372#44592'/'#51064#49604
      TabOrder = 15
      object btnGetPopUpURL: TButton
        Left = 12
        Top = 24
        Width = 164
        Height = 25
        Caption = #49464#44552#44228#49328#49436' '#48372#44592' URL'
        TabOrder = 0
        OnClick = btnGetPopUpURLClick
      end
      object btnGetPrintURL: TButton
        Left = 12
        Top = 81
        Width = 164
        Height = 25
        Caption = #44277#44553#51088' '#51064#49604' '#54045#50629' URL'
        TabOrder = 1
        OnClick = btnGetPrintURLClick
      end
      object btnGetMassPrintURL: TButton
        Left = 12
        Top = 172
        Width = 164
        Height = 25
        Caption = #45824#47049' '#51064#49604' '#54045#50629' URL'
        TabOrder = 2
        OnClick = btnGetMassPrintURLClick
      end
      object btnGetMailURL: TButton
        Left = 184
        Top = 24
        Width = 180
        Height = 25
        Caption = #47700#51068#47553#53356' URL'
        TabOrder = 3
        OnClick = btnGetMailURLClick
      end
      object btnGetEPrintUrl: TButton
        Left = 12
        Top = 142
        Width = 164
        Height = 25
        Caption = #44277#44553#48155#45716#51088' '#51064#49604' '#54045#50629' URL'
        TabOrder = 4
        OnClick = btnGetEPrintUrlClick
      end
      object btnGetViewURL: TButton
        Left = 12
        Top = 53
        Width = 164
        Height = 25
        Caption = #49464#44552#44228#49328#49436' '#48372#44592' URL('#47700#45684'x)'
        TabOrder = 5
        OnClick = btnGetViewURLClick
      end
      object btnGetPDFURL: TButton
        Left = 184
        Top = 53
        Width = 180
        Height = 25
        Caption = #49464#44552#44228#49328#49436' PDF '#45796#50868#47196#46300' URL'
        TabOrder = 6
        OnClick = btnGetPDFURLClick
      end
      object btnGetOldPrintURL: TButton
        Left = 12
        Top = 112
        Width = 164
        Height = 25
        Caption = '('#44396') '#44277#44553#51088' '#51064#49604' '#54045#50629' URL'
        TabOrder = 7
        OnClick = btnGetOldPrintURLClick
      end
    end
    object btnRegistRequest: TButton
      Left = 616
      Top = 124
      Width = 81
      Height = 25
      Caption = #51593#49884#50836#52397
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      OnClick = btnRegistRequestClick
    end
    object GroupBox22: TGroupBox
      Left = 1092
      Top = 63
      Width = 161
      Height = 272
      Caption = #52488#45824#47049' '#48156#54665
      TabOrder = 20
      object Label7: TLabel
        Left = 15
        Top = 18
        Width = 113
        Height = 13
        Caption = #51228#52636#50500#51060#46356'(SubmitID) : '
      end
      object Button2: TButton
        Left = 14
        Top = 69
        Width = 135
        Height = 25
        Caption = #52488#45824#47049' '#48156#54665' '#51217#49688
        TabOrder = 0
        OnClick = btnBulkSubmitClick
      end
      object txtSubmitID: TEdit
        Left = 13
        Top = 38
        Width = 132
        Height = 21
        ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
        TabOrder = 1
      end
      object btnGetBulkResult: TButton
        Left = 14
        Top = 101
        Width = 135
        Height = 25
        Caption = #52488#45824#47049' '#51217#49688#44208#44284' '#54869#51064
        TabOrder = 2
        OnClick = btnGetBulkResultClick
      end
    end
  end
  object GroupBox8: TGroupBox
    Left = 8
    Top = 40
    Width = 1273
    Height = 185
    Caption = #54045#48716' '#44592#48376' API'
    TabOrder = 1
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 137
      Height = 122
      Caption = #54924#50896#44032#51077
      TabOrder = 0
      object btnJoinMember: TButton
        Left = 8
        Top = 88
        Width = 120
        Height = 25
        Caption = #50672#46041#54924#50896' '#49888#44508#44032#51077
        TabOrder = 0
        OnClick = btnJoinMemberClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 120
        Height = 25
        Caption = #44032#51077#50668#48512' '#54869#51064
        TabOrder = 1
        OnClick = btnCheckIsMemberClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = #50500#51060#46356' '#51473#48373' '#54869#51064
        TabOrder = 2
        OnClick = btnCheckIDClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 160
      Top = 24
      Width = 145
      Height = 122
      Caption = #54252#51064#53944' '#44288#47144
      TabOrder = 1
      object btnGetUnitCost: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = #48156#54665' '#45800#44032' '#54869#51064
        TabOrder = 0
        OnClick = btnGetUnitCostClick
      end
      object btnGetChargeInfo: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = #44284#44552#51221#48372' '#54869#51064
        TabOrder = 1
        OnClick = btnGetChargeInfoClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 768
      Top = 24
      Width = 183
      Height = 123
      Caption = #54045#48716' '#44592#48376' URL'
      TabOrder = 2
      object btnGetAccessURL: TButton
        Left = 8
        Top = 25
        Width = 166
        Height = 25
        Caption = #54045#48716' '#47196#44536#51064' URL'
        TabOrder = 0
        OnClick = btnGetAccessURLClick
      end
      object btnGetSealURL: TButton
        Left = 8
        Top = 56
        Width = 165
        Height = 25
        Caption = #51064#44048' '#48143' '#52392#48512#47928#49436' '#46321#47197' URL'
        TabOrder = 1
        OnClick = btnGetSealURLClick
      end
    end
    object GroupBox14: TGroupBox
      Left = 312
      Top = 24
      Width = 145
      Height = 153
      Caption = #44277#46041#51064#51613#49436' '#44288#47144
      TabOrder = 3
      object btnGetCertificateExpireDate: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = #51064#51613#49436' '#47564#47308#51068' '#54869#51064
        TabOrder = 0
        OnClick = btnGetCertificateExpireDateClick
      end
      object btnGetTaxCertURL: TButton
        Left = 6
        Top = 24
        Width = 131
        Height = 25
        Caption = #51064#51613#49436' '#46321#47197' URL'
        TabOrder = 1
        OnClick = btnGetTaxCertURLClick
      end
      object btnCheckCertValidation: TButton
        Left = 6
        Top = 88
        Width = 131
        Height = 25
        Caption = #51064#51613#49436' '#50976#54952#49457' '#54869#51064
        TabOrder = 2
        OnClick = btnCheckCertValidationClick
      end
      object Button1: TButton
        Left = 6
        Top = 120
        Width = 131
        Height = 25
        Caption = #51064#51613#49436' '#51221#48372' '#54869#51064
        TabOrder = 3
        OnClick = btnGetTaxCertInfoClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 960
      Top = 24
      Width = 145
      Height = 153
      Caption = #45812#45817#51088' '#44288#47144
      TabOrder = 4
      object btnUpdateContact: TButton
        Left = 8
        Top = 120
        Width = 129
        Height = 25
        Caption = #45812#45817#51088' '#51221#48372' '#49688#51221
        TabOrder = 0
        OnClick = btnUpdateContactClick
      end
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = #45812#45817#51088' '#52628#44032
        TabOrder = 1
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = #45812#45817#51088' '#47785#47197' '#51312#54924
        TabOrder = 2
        OnClick = btnListContactClick
      end
      object btnGetContactInfo: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = #45812#45817#51088' '#51221#48372' '#54869#51064
        TabOrder = 3
        OnClick = btnGetContactInfoClick
      end
    end
    object GroupBox16: TGroupBox
      Left = 1112
      Top = 24
      Width = 145
      Height = 122
      Caption = #54924#49324#51221#48372' '#44288#47144
      TabOrder = 5
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = #54924#49324#51221#48372' '#51312#54924
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 128
        Height = 25
        Caption = #54924#49324#51221#48372' '#49688#51221
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
  end
  object txtCorpNum: TEdit
    Left = 144
    Top = 8
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 2
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 384
    Top = 8
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 3
    Text = 'testkorea'
  end
  object GroupBox17: TGroupBox
    Left = 472
    Top = 64
    Width = 145
    Height = 153
    Caption = #50672#46041#44284#44552' '#54252#51064#53944
    TabOrder = 4
    object btnGetBalance: TButton
      Left = 8
      Top = 24
      Width = 129
      Height = 25
      Caption = #51092#50668#54252#51064#53944' '#54869#51064
      TabOrder = 0
      OnClick = btnGetBalanceClick
    end
    object btnGetChargeURL: TButton
      Left = 8
      Top = 56
      Width = 128
      Height = 25
      Caption = #54252#51064#53944' '#52649#51204' URL'
      TabOrder = 1
      OnClick = btnGetChargeURLClick
    end
    object btnGetPaymentURL: TButton
      Left = 8
      Top = 88
      Width = 128
      Height = 25
      Caption = #54252#51064#53944' '#44208#51228#45236#50669' URL'
      TabOrder = 2
      OnClick = btnGetPaymentURLClick
    end
    object btnGetUseHistoryURL: TButton
      Left = 8
      Top = 120
      Width = 128
      Height = 25
      Caption = #54252#51064#53944' '#49324#50857#45236#50669' URL'
      TabOrder = 3
      OnClick = btnGetUseHistoryURLClick
    end
  end
  object GroupBox18: TGroupBox
    Left = 624
    Top = 64
    Width = 145
    Height = 123
    Caption = #54028#53944#45320#44284#44552' '#54252#51064#53944
    TabOrder = 5
    object btnGetPartnerBalance: TButton
      Left = 8
      Top = 24
      Width = 129
      Height = 25
      Caption = #51092#50668#54252#51064#53944' '#54869#51064
      TabOrder = 0
      OnClick = btnGetPartnerBalanceClick
    end
    object btnGetPartnerURL: TButton
      Left = 8
      Top = 56
      Width = 129
      Height = 25
      Caption = #54252#51064#53944' '#52649#51204' URL'
      TabOrder = 1
      OnClick = btnGetPartnerURLClick
    end
  end
  object txtURL: TEdit
    Left = 904
    Top = 8
    Width = 377
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 6
  end
  object OpenDialog1: TOpenDialog
    Left = 728
    Top = 8
  end
end
