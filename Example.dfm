object frmExample: TfrmExample
  Left = 200
  Top = 148
  Width = 1325
  Height = 846
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
    Top = 208
    Width = 1273
    Height = 577
    Caption = '���ڼ��ݰ�꼭 ���� API'
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 30
      Width = 120
      Height = 13
      Caption = '����������ȣ(MgtKey) :'
    end
    object GroupBox21: TGroupBox
      Left = 640
      Top = 72
      Width = 601
      Height = 225
      Caption = '������ ���μ���'
      TabOrder = 19
    end
    object GroupBox20: TGroupBox
      Left = 16
      Top = 72
      Width = 609
      Height = 273
      Caption = '������ ���μ���'
      TabOrder = 18
    end
    object GroupBox19: TGroupBox
      Left = 656
      Top = 96
      Width = 305
      Height = 185
      Caption = '(����) ��ÿ�û ���μ���'
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
        Top = 64
        Width = 89
        Height = 1
      end
      object Shape27: TShape
        Left = 160
        Top = 64
        Width = 1
        Height = 89
      end
      object Shape28: TShape
        Left = 72
        Top = 64
        Width = 1
        Height = 97
      end
      object Shape31: TShape
        Left = 112
        Top = 48
        Width = 1
        Height = 17
      end
      object Shape30: TShape
        Left = 16
        Top = 24
        Width = 265
        Height = 33
        Brush.Color = clAppWorkSpace
        Pen.Style = psClear
      end
      object btnIssue_Reverse_sub: TButton
        Left = 39
        Top = 80
        Width = 66
        Height = 25
        Caption = '����'
        TabOrder = 0
        OnClick = btnIssue_Reverse_subClick
      end
      object btnCancelIssue_Reverse_sub: TButton
        Left = 40
        Top = 136
        Width = 65
        Height = 25
        Caption = '�������'
        TabOrder = 1
        OnClick = btnCancelIssue_Reverse_subClick
      end
      object btnCancelRequest_sub: TButton
        Left = 208
        Top = 80
        Width = 65
        Height = 25
        Caption = '��û���'
        TabOrder = 2
        OnClick = btnCancelRequest_subClick
      end
      object btnRefuse_sub: TButton
        Left = 128
        Top = 80
        Width = 65
        Height = 25
        Caption = '�ź�'
        TabOrder = 3
        OnClick = btnRefuse_subClick
      end
      object btnDelete_Reverse_sub: TButton
        Left = 208
        Top = 136
        Width = 65
        Height = 25
        Caption = '����'
        TabOrder = 4
        OnClick = btnDelete_Reverse_subClick
      end
      object StaticText1: TStaticText
        Left = 40
        Top = 34
        Width = 56
        Height = 16
        Caption = '��ÿ�û'
        Color = clAppWorkSpace
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = '����'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 5
      end
    end
    object GroupBox15: TGroupBox
      Left = 40
      Top = 96
      Width = 225
      Height = 169
      Caption = '(����) ��ù��� ���μ���'
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
      Left = 288
      Top = 96
      Width = 321
      Height = 193
      Caption = '�ӽ����� ����, ���࿹�� ���μ���'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Shape3: TShape
        Left = 80
        Top = 64
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
        Top = 120
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
        Left = 263
        Top = 75
        Width = 1
        Height = 94
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
        Top = 24
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
        Top = 34
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
        Top = 69
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
      object Shape6: TShape
        Left = 215
        Top = 75
        Width = 2
        Height = 89
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object Shape29: TShape
        Left = 255
        Top = 83
        Width = 2
        Height = 89
        Brush.Color = clNavy
        Pen.Style = psClear
      end
      object btnRegister: TButton
        Left = 80
        Top = 28
        Width = 33
        Height = 25
        Caption = '���'
        TabOrder = 0
        OnClick = btnRegisterClick
      end
      object btnUpdate: TButton
        Left = 120
        Top = 28
        Width = 33
        Height = 25
        Caption = '����'
        TabOrder = 1
        OnClick = btnUpdateClick
      end
      object btnSend: TButton
        Left = 88
        Top = 72
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
        Top = 160
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
        Top = 104
        Width = 41
        Height = 25
        Caption = '����'
        TabOrder = 6
        OnClick = btnAcceptClick
      end
      object btnDeny: TButton
        Left = 192
        Top = 104
        Width = 41
        Height = 25
        Caption = '�ź�'
        TabOrder = 7
        OnClick = btnDenyClick
      end
      object btnCancel_Send: TButton
        Left = 240
        Top = 104
        Width = 41
        Height = 25
        Caption = '���'
        TabOrder = 8
        OnClick = btnCancel_SendClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 368
      Width = 200
      Height = 181
      Caption = '÷������'
      TabOrder = 1
      object Label2: TLabel
        Left = 12
        Top = 84
        Width = 89
        Height = 13
        AutoSize = False
        Caption = '������ ����ID:'
      end
      object btnGetFileList: TButton
        Left = 12
        Top = 53
        Width = 174
        Height = 25
        Caption = '÷������ ���'
        TabOrder = 0
        OnClick = btnGetFileListClick
      end
      object btnAttachFile: TButton
        Left = 12
        Top = 24
        Width = 174
        Height = 25
        Caption = '���� ÷��'
        TabOrder = 1
        OnClick = btnAttachFileClick
      end
      object btnDeleteFile: TButton
        Left = 12
        Top = 124
        Width = 174
        Height = 25
        Caption = '÷������ ����'
        TabOrder = 2
        OnClick = btnDeleteFileClick
      end
      object tbFileIndexID: TEdit
        Left = 12
        Top = 98
        Width = 174
        Height = 21
        ImeName = '�ѱ��� �Է� �ý��� (IME 2000)'
        TabOrder = 3
      end
    end
    object GroupBox5: TGroupBox
      Left = 231
      Top = 368
      Width = 200
      Height = 181
      Caption = '���� ����'
      TabOrder = 2
      object btnGetDetailInfo: TButton
        Left = 12
        Top = 113
        Width = 174
        Height = 25
        Caption = '���� ������'
        TabOrder = 0
        OnClick = btnGetDetailInfoClick
      end
      object btnGetLogs: TButton
        Left = 12
        Top = 83
        Width = 174
        Height = 25
        Caption = '���� �̷�'
        TabOrder = 1
        OnClick = btnGetLogsClick
      end
      object btnGetInfo: TButton
        Left = 12
        Top = 24
        Width = 174
        Height = 25
        Caption = '���� ����'
        TabOrder = 2
        OnClick = btnGetInfoClick
      end
      object btnGetInfos: TButton
        Left = 12
        Top = 54
        Width = 174
        Height = 25
        Caption = '���� ����(�뷮)'
        TabOrder = 3
        OnClick = btnGetInfosClick
      end
      object btnSearchInfo: TButton
        Left = 12
        Top = 142
        Width = 174
        Height = 25
        Caption = '���� �����ȸ'
        TabOrder = 4
        OnClick = btnSearchInfoClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 661
      Top = 368
      Width = 377
      Height = 181
      Caption = '�ΰ�����'
      TabOrder = 3
      object btnReSendEmail: TButton
        Left = 12
        Top = 24
        Width = 174
        Height = 25
        Caption = '�̸��� ����'
        TabOrder = 0
        OnClick = btnReSendEmailClick
      end
      object btnReSendSMS: TButton
        Left = 12
        Top = 54
        Width = 174
        Height = 25
        Caption = '���� ����'
        TabOrder = 1
        OnClick = btnReSendSMSClick
      end
      object btnSendInvoiceFax: TButton
        Left = 12
        Top = 83
        Width = 174
        Height = 25
        Caption = '�ѽ� ����'
        TabOrder = 2
        OnClick = btnSendInvoiceFaxClick
      end
      object btnDetachStatement: TButton
        Left = 12
        Top = 142
        Width = 174
        Height = 25
        Caption = '���ڸ��� ÷������'
        TabOrder = 3
        OnClick = btnDetachStatementClick
      end
      object btnAttachStatement: TButton
        Left = 12
        Top = 113
        Width = 174
        Height = 25
        Caption = '���ڸ��� ÷��'
        TabOrder = 4
        OnClick = btnAttachStatementClick
      end
      object btnAssignMgtKey: TButton
        Left = 196
        Top = 24
        Width = 174
        Height = 25
        Caption = '������ȣ �Ҵ�'
        TabOrder = 5
        OnClick = btnAssignMgtKeyClick
      end
      object btnListEmailConfig: TButton
        Left = 196
        Top = 54
        Width = 174
        Height = 25
        Caption = '�˸����� ���۸�� ��ȸ'
        TabOrder = 6
        OnClick = btnListEmailConfigClick
      end
      object btnUpdateEmailConfig: TButton
        Left = 196
        Top = 83
        Width = 174
        Height = 25
        Caption = '�˸����� ���ۼ��� ����'
        TabOrder = 7
        OnClick = btnUpdateEmailConfigClick
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
      Left = 1053
      Top = 368
      Width = 200
      Height = 181
      Caption = '��Ÿ  URL'
      TabOrder = 6
      object btnGetTaxinvoiceURL1: TButton
        Left = 12
        Top = 24
        Width = 174
        Height = 25
        Caption = '����������'
        TabOrder = 0
        OnClick = btnGetTaxinvoiceURL1Click
      end
      object btnGetTaxinvoiceURL2: TButton
        Left = 12
        Top = 54
        Width = 174
        Height = 25
        Caption = '���⺸����'
        TabOrder = 1
        OnClick = btnGetTaxinvoiceURL2Click
      end
      object btnGetTaxinvoiceURL3: TButton
        Left = 12
        Top = 83
        Width = 174
        Height = 25
        Caption = '���Ժ�����'
        TabOrder = 2
        OnClick = btnGetTaxinvoiceURL3Click
      end
      object btnGetTaxinvoiceURL4: TButton
        Left = 12
        Top = 113
        Width = 174
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
      Left = 976
      Top = 96
      Width = 257
      Height = 185
      Caption = '�ӽ����� ������ ���μ���'
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
      Left = 104
      Top = 304
      Width = 401
      Height = 25
      Caption = '����û ����'
      TabOrder = 10
      OnClick = btnSendToNTSClick
    end
    object btnRegistIssue: TButton
      Left = 64
      Top = 140
      Width = 75
      Height = 25
      Caption = '��ù���'
      TabOrder = 11
      OnClick = btnRegistIssueClick
    end
    object btnCancelIssue: TButton
      Left = 64
      Top = 200
      Width = 75
      Height = 25
      Caption = '�������'
      TabOrder = 12
      OnClick = btnCancelIssueClick
    end
    object btnDelete_RegistIssue: TButton
      Left = 176
      Top = 200
      Width = 65
      Height = 25
      Caption = '����'
      TabOrder = 13
      OnClick = btnDelete_RegistIssueClick
    end
    object GroupBox7: TGroupBox
      Left = 446
      Top = 368
      Width = 200
      Height = 181
      Caption = ' �������� URL���'
      TabOrder = 15
      object btnGetPopUpURL: TButton
        Left = 12
        Top = 24
        Width = 174
        Height = 25
        Caption = '���� ���뺸�� �˾� URL'
        TabOrder = 0
        OnClick = btnGetPopUpURLClick
      end
      object btnGetPrintURL: TButton
        Left = 12
        Top = 54
        Width = 174
        Height = 25
        Caption = '�μ� �˾� URL'
        TabOrder = 1
        OnClick = btnGetPrintURLClick
      end
      object btnGetPrintsURL: TButton
        Left = 12
        Top = 113
        Width = 174
        Height = 25
        Caption = '�뷮�μ� �˾� URL'
        TabOrder = 2
        OnClick = btnGetPrintsURLClick
      end
      object btnGetMailURL: TButton
        Left = 12
        Top = 142
        Width = 174
        Height = 25
        Caption = '�̸����� �����ư URL'
        TabOrder = 3
        OnClick = btnGetMailURLClick
      end
      object btnGetEPrintUrl: TButton
        Left = 12
        Top = 83
        Width = 174
        Height = 25
        Caption = '���޹޴��� �μ� �˾� URL'
        TabOrder = 4
        OnClick = btnGetEPrintUrlClick
      end
    end
    object btnRegistRequest: TButton
      Left = 848
      Top = 124
      Width = 81
      Height = 25
      Caption = '��ÿ�û'
      TabOrder = 16
      OnClick = btnRegistRequestClick
    end
  end
  object GroupBox8: TGroupBox
    Left = 8
    Top = 40
    Width = 1273
    Height = 158
    Caption = '�˺� �⺻ API'
    TabOrder = 1
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 137
      Height = 122
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
      Left = 160
      Top = 24
      Width = 145
      Height = 122
      Caption = '����Ʈ ����'
      TabOrder = 1
      object btnGetUnitCost: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = '��� �ܰ� Ȯ��'
        TabOrder = 0
        OnClick = btnGetUnitCostClick
      end
      object btnGetChargeInfo: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '�������� Ȯ��'
        TabOrder = 1
        OnClick = btnGetChargeInfoClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 768
      Top = 24
      Width = 183
      Height = 123
      Caption = '�˺� �⺻ URL'
      TabOrder = 2
      object btnGetAccessURL: TButton
        Left = 8
        Top = 25
        Width = 166
        Height = 25
        Caption = '�˺� �α��� URL'
        TabOrder = 0
        OnClick = btnGetAccessURLClick
      end
      object btnGetSealURL: TButton
        Left = 8
        Top = 56
        Width = 165
        Height = 25
        Caption = '�ΰ� �� ÷�ι��� ��� URL'
        TabOrder = 1
        OnClick = btnGetSealURLClick
      end
    end
    object GroupBox14: TGroupBox
      Left = 312
      Top = 24
      Width = 145
      Height = 122
      Caption = '���������� ����'
      TabOrder = 3
      object btnGetCertificateExpireDate: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '������ ������ Ȯ��'
        TabOrder = 0
        OnClick = btnGetCertificateExpireDateClick
      end
      object btnGetTaxCertURL: TButton
        Left = 6
        Top = 56
        Width = 131
        Height = 25
        Caption = '������ ��� URL'
        TabOrder = 1
        OnClick = btnGetTaxCertURLClick
      end
      object btnCheckCertValidation: TButton
        Left = 6
        Top = 88
        Width = 131
        Height = 25
        Caption = '������ ��ȿ�� Ȯ��'
        TabOrder = 2
        OnClick = btnCheckCertValidationClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 960
      Top = 24
      Width = 145
      Height = 123
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
      Left = 1112
      Top = 24
      Width = 145
      Height = 122
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
    Height = 124
    Caption = '�������� ����Ʈ'
    TabOrder = 4
    object btnGetBalance: TButton
      Left = 8
      Top = 24
      Width = 129
      Height = 25
      Caption = '�ܿ�����Ʈ Ȯ��'
      TabOrder = 0
      OnClick = btnGetBalanceClick
    end
    object btnGetChargeURL: TButton
      Left = 11
      Top = 56
      Width = 125
      Height = 25
      Caption = '����Ʈ ���� URL'
      TabOrder = 1
      OnClick = btnGetChargeURLClick
    end
  end
  object GroupBox18: TGroupBox
    Left = 624
    Top = 64
    Width = 145
    Height = 123
    Caption = '��Ʈ�ʰ��� ����Ʈ'
    TabOrder = 5
    object btnGetPartnerBalance: TButton
      Left = 8
      Top = 24
      Width = 129
      Height = 25
      Caption = '��Ʈ������Ʈ Ȯ��'
      TabOrder = 0
      OnClick = btnGetPartnerBalanceClick
    end
    object btnGetPartnerURL: TButton
      Left = 8
      Top = 56
      Width = 129
      Height = 25
      Caption = '����Ʈ ���� URL'
      TabOrder = 1
      OnClick = btnGetPartnerURLClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 728
    Top = 8
  end
end
