object frmExample: TfrmExample
  Left = 511
  Top = 120
  Width = 954
  Height = 791
  Caption = 'Linkhub �˺� ���ڼ��ݰ�꼭  SDK Examples'
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
    Caption = '�˺�ȸ�� ����ڹ�ȣ : '
  end
  object Label4: TLabel
    Left = 304
    Top = 12
    Width = 81
    Height = 13
    AutoSize = False
    Caption = '�˺����̵� : '
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 224
    Width = 913
    Height = 513
    Caption = '���ڼ��ݰ�꼭 ���� API'
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 30
      Width = 120
      Height = 13
      Caption = '����������ȣ(MgtKey) :'
    end
    object GroupBox15: TGroupBox
      Left = 32
      Top = 64
      Width = 225
      Height = 169
      Caption = '������ ( ��ù���) ���μ���'
      TabOrder = 14
      object Shape19: TShape
        Left = 60
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
        Top = 40
        Width = 201
        Height = 33
        Brush.Color = clAppWorkSpace
        Pen.Style = psClear
      end
    end
    object GroupBox2: TGroupBox
      Left = 280
      Top = 64
      Width = 321
      Height = 185
      Caption = '������ ( �ӽ����� ����, ���࿹�� ) ���μ���'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Shape3: TShape
        Left = 80
        Top = 56
        Width = 209
        Height = 89
        Brush.Color = clAppWorkSpace
        Pen.Style = psClear
      end
      object Shape10: TShape
        Left = 116
        Top = 46
        Width = 2
        Height = 70
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape11: TShape
        Left = 295
        Top = 48
        Width = 2
        Height = 118
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape2: TShape
        Left = 45
        Top = 48
        Width = 2
        Height = 120
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape8: TShape
        Left = 72
        Top = 125
        Width = 95
        Height = 2
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape9: TShape
        Left = 53
        Top = 164
        Width = 244
        Height = 2
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape7: TShape
        Left = 261
        Top = 75
        Width = 2
        Height = 80
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape6: TShape
        Left = 213
        Top = 75
        Width = 2
        Height = 80
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape4: TShape
        Left = 165
        Top = 76
        Width = 2
        Height = 50
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape5: TShape
        Left = 149
        Top = 75
        Width = 114
        Height = 2
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape1: TShape
        Left = 16
        Top = 16
        Width = 289
        Height = 33
        Brush.Color = clAppWorkSpace
        Pen.Style = psClear
      end
      object Shape12: TShape
        Left = 32
        Top = 114
        Width = 85
        Height = 2
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Label6: TLabel
        Left = 24
        Top = 26
        Width = 52
        Height = 12
        Caption = '�ӽ�����'
        Color = clAppWorkSpace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = '����'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label7: TLabel
        Left = 232
        Top = 61
        Width = 52
        Height = 12
        Caption = '���࿹��'
        Color = clAppWorkSpace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = '����'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object btnRegister: TButton
        Left = 80
        Top = 20
        Width = 33
        Height = 25
        Caption = '���'
        TabOrder = 0
        OnClick = btnRegisterClick
      end
      object btnUpdate: TButton
        Left = 120
        Top = 20
        Width = 33
        Height = 25
        Caption = '����'
        TabOrder = 1
        OnClick = btnUpdateClick
      end
      object btnSend: TButton
        Left = 88
        Top = 64
        Width = 60
        Height = 25
        Caption = '���࿹��'
        TabOrder = 2
        OnClick = btnSendClick
      end
      object btnCancel_Issue: TButton
        Left = 16
        Top = 152
        Width = 60
        Height = 25
        Caption = '�������'
        TabOrder = 3
        OnClick = btnCancel_IssueClick
      end
      object btnDelete: TButton
        Left = 204
        Top = 152
        Width = 65
        Height = 25
        Caption = '����'
        TabOrder = 4
        OnClick = btnDeleteClick
      end
      object btnIssue: TButton
        Left = 16
        Top = 106
        Width = 60
        Height = 25
        Caption = '����'
        TabOrder = 5
        OnClick = btnIssueClick
      end
      object btnAccept: TButton
        Left = 144
        Top = 96
        Width = 41
        Height = 25
        Caption = '����'
        TabOrder = 6
        OnClick = btnAcceptClick
      end
      object btnDeny: TButton
        Left = 192
        Top = 96
        Width = 41
        Height = 25
        Caption = '�ź�'
        TabOrder = 7
        OnClick = btnDenyClick
      end
      object btnCancel_Send: TButton
        Left = 240
        Top = 96
        Width = 41
        Height = 25
        Caption = '���'
        TabOrder = 8
        OnClick = btnCancel_SendClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 32
      Top = 312
      Width = 145
      Height = 161
      Caption = '÷������'
      TabOrder = 1
      object Label2: TLabel
        Left = 17
        Top = 84
        Width = 89
        Height = 13
        AutoSize = False
        Caption = '������ ����ID:'
      end
      object btnGetFileList: TButton
        Left = 17
        Top = 53
        Width = 113
        Height = 25
        Caption = '÷������ ���'
        TabOrder = 0
        OnClick = btnGetFileListClick
      end
      object btnAttachFile: TButton
        Left = 17
        Top = 24
        Width = 113
        Height = 25
        Caption = '���� ÷��'
        TabOrder = 1
        OnClick = btnAttachFileClick
      end
      object btnDeleteFile: TButton
        Left = 17
        Top = 124
        Width = 113
        Height = 25
        Caption = '÷������ ����'
        TabOrder = 2
        OnClick = btnDeleteFileClick
      end
      object tbFileIndexID: TEdit
        Left = 17
        Top = 98
        Width = 113
        Height = 21
        ImeName = '�ѱ��� �Է� �ý��� (IME 2000)'
        TabOrder = 3
      end
    end
    object GroupBox5: TGroupBox
      Left = 196
      Top = 312
      Width = 145
      Height = 193
      Caption = '���� ����'
      TabOrder = 2
      object btnGetDetailInfo: TButton
        Left = 17
        Top = 120
        Width = 113
        Height = 25
        Caption = '���� ������'
        TabOrder = 0
        OnClick = btnGetDetailInfoClick
      end
      object btnGetLogs: TButton
        Left = 17
        Top = 88
        Width = 113
        Height = 25
        Caption = '���� �̷�'
        TabOrder = 1
        OnClick = btnGetLogsClick
      end
      object btnGetInfo: TButton
        Left = 17
        Top = 24
        Width = 113
        Height = 25
        Caption = '���� ����'
        TabOrder = 2
        OnClick = btnGetInfoClick
      end
      object btnGetInfos: TButton
        Left = 17
        Top = 56
        Width = 113
        Height = 25
        Caption = '���� ����(�뷮)'
        TabOrder = 3
        OnClick = btnGetInfosClick
      end
      object btnSearchInfo: TButton
        Left = 16
        Top = 152
        Width = 113
        Height = 25
        Caption = '���� �����ȸ'
        TabOrder = 4
        OnClick = btnSearchInfoClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 600
      Top = 312
      Width = 129
      Height = 161
      Caption = '�ΰ�����'
      TabOrder = 3
      object btnReSendEmail: TButton
        Left = 16
        Top = 24
        Width = 97
        Height = 25
        Caption = '�̸��� ����'
        TabOrder = 0
        OnClick = btnReSendEmailClick
      end
      object btnReSendSMS: TButton
        Left = 16
        Top = 56
        Width = 97
        Height = 25
        Caption = '���� ����'
        TabOrder = 1
        OnClick = btnReSendSMSClick
      end
      object btnSendInvoiceFax: TButton
        Left = 16
        Top = 88
        Width = 97
        Height = 25
        Caption = '�ѽ� ����'
        TabOrder = 2
        OnClick = btnSendInvoiceFaxClick
      end
    end
    object tbMgtKey: TEdit
      Left = 244
      Top = 26
      Width = 205
      Height = 21
      ImeName = '�ѱ��� �Է� �ý��� (IME 2000)'
      TabOrder = 4
    end
    object btnCheckMgtKeyInUse: TButton
      Left = 465
      Top = 26
      Width = 161
      Height = 21
      Caption = '������ȣ ��뿩�� Ȯ��'
      TabOrder = 5
      OnClick = btnCheckMgtKeyInUseClick
    end
    object GroupBox10: TGroupBox
      Left = 744
      Top = 312
      Width = 129
      Height = 161
      Caption = '��Ÿ  URL'
      TabOrder = 6
      object btnGetTaxinvoiceURL1: TButton
        Left = 10
        Top = 24
        Width = 110
        Height = 25
        Caption = '����������'
        TabOrder = 0
        OnClick = btnGetTaxinvoiceURL1Click
      end
      object btnGetTaxinvoiceURL2: TButton
        Left = 10
        Top = 56
        Width = 110
        Height = 25
        Caption = '���⺸����'
        TabOrder = 1
        OnClick = btnGetTaxinvoiceURL2Click
      end
      object btnGetTaxinvoiceURL3: TButton
        Left = 10
        Top = 88
        Width = 110
        Height = 25
        Caption = '���Ժ�����'
        TabOrder = 2
        OnClick = btnGetTaxinvoiceURL3Click
      end
      object btnGetTaxinvoiceURL4: TButton
        Left = 10
        Top = 120
        Width = 110
        Height = 25
        Caption = '�����ۼ�'
        TabOrder = 3
        OnClick = btnGetTaxinvoiceURL4Click
      end
    end
    object cbMgtKeyType: TComboBox
      Left = 168
      Top = 26
      Width = 73
      Height = 21
      ImeName = 'Microsoft IME 2010'
      ItemHeight = 13
      TabOrder = 7
      Text = 'SELL'
      OnChange = cbMgtKeyTypeChange
      Items.Strings = (
        'SELL'
        'BUY'
        'TRUSTEE')
    end
    object GroupBox13: TGroupBox
      Left = 632
      Top = 64
      Width = 257
      Height = 185
      Caption = '������ ���μ���'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      object Shape15: TShape
        Left = 191
        Top = 44
        Width = 2
        Height = 117
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape16: TShape
        Left = 77
        Top = 48
        Width = 2
        Height = 113
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape18: TShape
        Left = 53
        Top = 156
        Width = 140
        Height = 2
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape23: TShape
        Left = 16
        Top = 16
        Width = 225
        Height = 33
        Brush.Color = clAppWorkSpace
        Pen.Style = psClear
      end
      object Label5: TLabel
        Left = 24
        Top = 26
        Width = 52
        Height = 12
        Caption = '�ӽ�����'
        Color = clAppWorkSpace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = '����'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Shape13: TShape
        Left = 116
        Top = 116
        Width = 41
        Height = 2
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape14: TShape
        Left = 115
        Top = 84
        Width = 2
        Height = 34
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape17: TShape
        Left = 116
        Top = 76
        Width = 41
        Height = 2
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object btnRegister_Reverse: TButton
        Left = 80
        Top = 20
        Width = 33
        Height = 25
        Caption = '���'
        TabOrder = 0
        OnClick = btnRegister_ReverseClick
      end
      object btnUpdate_Reverse: TButton
        Left = 120
        Top = 20
        Width = 33
        Height = 25
        Caption = '����'
        TabOrder = 1
        OnClick = btnUpdate_ReverseClick
      end
      object btnCancelIssue_Reverse: TButton
        Left = 48
        Top = 144
        Width = 60
        Height = 25
        Caption = '�������'
        TabOrder = 2
        OnClick = btnCancel_IssueClick
      end
      object btnDelete_Reverse: TButton
        Left = 156
        Top = 144
        Width = 65
        Height = 25
        Caption = '����'
        TabOrder = 3
        OnClick = btnDeleteClick
      end
      object btnIssue_Reverse: TButton
        Left = 48
        Top = 106
        Width = 60
        Height = 25
        Caption = '����'
        TabOrder = 4
        OnClick = btnIssueClick
      end
      object btnCancelRequest: TButton
        Left = 152
        Top = 66
        Width = 73
        Height = 25
        Caption = '��û���'
        TabOrder = 5
        OnClick = btnCancelRequestClick
      end
      object btnRequest: TButton
        Left = 32
        Top = 66
        Width = 97
        Height = 25
        Caption = '(��)�����û'
        TabOrder = 6
        OnClick = btnRequestClick
      end
      object btnRefuse: TButton
        Left = 152
        Top = 104
        Width = 73
        Height = 25
        Caption = '�ź�'
        TabOrder = 7
        OnClick = btnRefuseClick
      end
    end
    object btnGetEmailPublicKey: TButton
      Left = 712
      Top = 24
      Width = 177
      Height = 25
      Caption = '�������� ���� ��� Ȯ��'
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
      Left = 248
      Top = 264
      Width = 401
      Height = 25
      Caption = '����û ����'
      TabOrder = 10
      OnClick = btnSendToNTSClick
    end
    object btnRegistIssue: TButton
      Left = 56
      Top = 108
      Width = 75
      Height = 25
      Caption = '��ù���'
      TabOrder = 11
      OnClick = btnRegistIssueClick
    end
    object btnCancelIssue: TButton
      Left = 56
      Top = 168
      Width = 75
      Height = 25
      Caption = '�������'
      TabOrder = 12
      OnClick = btnCancelIssueClick
    end
    object btnDelete_RegistIssue: TButton
      Left = 176
      Top = 168
      Width = 65
      Height = 25
      Caption = '����'
      TabOrder = 13
      OnClick = btnDelete_RegistIssueClick
    end
  end
  object GroupBox8: TGroupBox
    Left = 8
    Top = 40
    Width = 913
    Height = 161
    Caption = '�˺� �⺻ API'
    TabOrder = 1
    object GroupBox9: TGroupBox
      Left = 8
      Top = 24
      Width = 137
      Height = 121
      Caption = 'ȸ������'
      TabOrder = 0
      object btnJoin: TButton
        Left = 8
        Top = 88
        Width = 120
        Height = 25
        Caption = 'ȸ�� ����'
        TabOrder = 0
        OnClick = btnJoinClick
      end
      object Button1: TButton
        Left = 8
        Top = 24
        Width = 120
        Height = 25
        Caption = '���Կ���Ȯ��'
        TabOrder = 1
        OnClick = Button1Click
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = 'ID �ߺ� Ȯ��'
        TabOrder = 2
        OnClick = btnCheckIDClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 152
      Top = 24
      Width = 145
      Height = 121
      Caption = '����Ʈ ����'
      TabOrder = 1
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '�ܿ�����Ʈ Ȯ��'
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetUnitCost: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = '��� �ܰ� Ȯ��'
        TabOrder = 1
        OnClick = btnGetUnitCostClick
      end
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = '��Ʈ������Ʈ Ȯ��'
        TabOrder = 2
        OnClick = btnGetPartnerBalanceClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 448
      Top = 24
      Width = 153
      Height = 121
      Caption = '�˺� �⺻ URL'
      TabOrder = 2
      object btnGetPopBillURL: TButton
        Left = 8
        Top = 25
        Width = 137
        Height = 25
        Caption = '�˺� �α��� URL'
        TabOrder = 0
        OnClick = btnGetPopBillURLClick
      end
      object btnGetPopbillURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 137
        Height = 25
        Caption = '����Ʈ ���� URL'
        TabOrder = 1
        OnClick = btnGetPopbillURL_CHRGClick
      end
      object btnGetPopbillURL_CERT: TButton
        Left = 8
        Top = 88
        Width = 137
        Height = 25
        Caption = '���������� ��� URL'
        TabOrder = 2
        OnClick = btnGetPopbillURL_CERTClick
      end
    end
    object GroupBox14: TGroupBox
      Left = 304
      Top = 24
      Width = 137
      Height = 121
      Caption = '���������� ����'
      TabOrder = 3
      object btnGetCertificateExpireDate: TButton
        Left = 8
        Top = 24
        Width = 121
        Height = 25
        Caption = '������ ������ Ȯ��'
        TabOrder = 0
        OnClick = btnGetCertificateExpireDateClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 608
      Top = 24
      Width = 145
      Height = 121
      Caption = '����� ����'
      TabOrder = 4
      object btnUpdateContact: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = '����� ���� ����'
        TabOrder = 0
        OnClick = btnUpdateContactClick
      end
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '����� �߰�'
        TabOrder = 1
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = '����� ��� ��ȸ'
        TabOrder = 2
        OnClick = btnListContactClick
      end
    end
    object GroupBox16: TGroupBox
      Left = 760
      Top = 24
      Width = 145
      Height = 121
      Caption = 'ȸ������ ����'
      TabOrder = 5
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = 'ȸ������ ��ȸ'
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 128
        Height = 25
        Caption = 'ȸ������ ����'
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
  end
  object GroupBox7: TGroupBox
    Left = 368
    Top = 536
    Width = 217
    Height = 193
    Caption = ' �������� URL���'
    TabOrder = 2
    object btnGetPopUpURL: TButton
      Left = 13
      Top = 24
      Width = 190
      Height = 25
      Caption = '���� ���뺸�� �˾� URL'
      TabOrder = 0
      OnClick = btnGetPopUpURLClick
    end
    object btnGetPrintURL: TButton
      Left = 13
      Top = 56
      Width = 190
      Height = 25
      Caption = '�μ� �˾� URL'
      TabOrder = 1
      OnClick = btnGetPrintURLClick
    end
    object btnGetPrintsURL: TButton
      Left = 13
      Top = 120
      Width = 190
      Height = 25
      Caption = '�뷮�μ� �˾� URL'
      TabOrder = 2
      OnClick = btnGetPrintsURLClick
    end
    object btnGetMailURL: TButton
      Left = 13
      Top = 152
      Width = 190
      Height = 25
      Caption = '�̸����� �����ư URL'
      TabOrder = 3
      OnClick = btnGetMailURLClick
    end
    object btnGetEPrintUrl: TButton
      Left = 13
      Top = 88
      Width = 190
      Height = 25
      Caption = '���޹޴��� �μ� �˾� URL'
      TabOrder = 4
      OnClick = btnGetEPrintUrlClick
    end
  end
  object txtCorpNum: TEdit
    Left = 144
    Top = 8
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 3
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 384
    Top = 8
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 4
    Text = 'testkorea'
  end
  object OpenDialog1: TOpenDialog
    Left = 728
    Top = 8
  end
end
