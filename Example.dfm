object frmExample: TfrmExample
  Left = 316
  Top = 142
  Width = 1312
  Height = 842
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
    object GroupBox20: TGroupBox
      Left = 16
      Top = 64
      Width = 561
      Height = 273
      Caption = '������ ���μ���'
      TabOrder = 18
      object btnGetSendToNTSConfig: TButton
        Left = 280
        Top = 232
        Width = 169
        Height = 33
        Caption = '����û ���� ���� Ȯ��'
        TabOrder = 0
        OnClick = btnGetSendToNTSConfigClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 296
      Top = 96
      Width = 257
      Height = 193
      Caption = '�ӽ����� ���� ���μ���'
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
      object btnRegister: TButton
        Left = 96
        Top = 42
        Width = 49
        Height = 25
        Caption = '���'
        TabOrder = 0
        OnClick = btnRegisterClick
      end
      object btnUpdate: TButton
        Left = 160
        Top = 42
        Width = 49
        Height = 25
        Caption = '����'
        TabOrder = 1
        OnClick = btnUpdateClick
      end
      object btnCancelIssue_sub: TButton
        Left = 40
        Top = 128
        Width = 65
        Height = 27
        Caption = '�������'
        TabOrder = 2
        OnClick = btnCancelIssue_subClick
      end
      object btnDelete_sub: TButton
        Left = 156
        Top = 128
        Width = 66
        Height = 26
        Caption = '����'
        TabOrder = 3
        OnClick = btnDelete_subClick
      end
      object btnIssue: TButton
        Left = 40
        Top = 82
        Width = 64
        Height = 26
        Caption = '����'
        TabOrder = 4
        OnClick = btnIssueClick
      end
    end
    object GroupBox21: TGroupBox
      Left = 608
      Top = 64
      Width = 625
      Height = 273
      Caption = '������ ���μ���'
      TabOrder = 19
      object Shape33: TShape
        Left = 464
        Top = 24
        Width = 33
        Height = 18
        Brush.Color = cl3DLight
        Pen.Style = psDot
      end
    end
    object GroupBox19: TGroupBox
      Left = 624
      Top = 96
      Width = 305
      Height = 193
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
        Caption = '����'
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
        Caption = '�������'
        TabOrder = 1
        OnClick = btnCancelIssue_reverseClick
      end
      object btnCancelRequest: TButton
        Left = 208
        Top = 88
        Width = 65
        Height = 25
        Caption = '��û���'
        TabOrder = 2
        OnClick = btnCancelRequestClick
      end
      object btnRefuse: TButton
        Left = 128
        Top = 88
        Width = 65
        Height = 25
        Caption = '�ź�'
        TabOrder = 3
        OnClick = btnRefuseClick
      end
      object btnDelete_reverse: TButton
        Left = 208
        Top = 144
        Width = 66
        Height = 26
        Caption = '����'
        TabOrder = 4
        OnClick = btnDelete_reverseClick
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
      Width = 241
      Height = 193
      Caption = '(����) ��ù��� ���μ���'
      TabOrder = 14
      object Shape19: TShape
        Left = 56
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
        Width = 201
        Height = 41
        Brush.Color = clAppWorkSpace
        Pen.Style = psClear
      end
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 360
      Width = 153
      Height = 209
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
        Width = 128
        Height = 25
        Caption = '÷������ ���'
        TabOrder = 0
        OnClick = btnGetFileListClick
      end
      object btnAttachFile: TButton
        Left = 12
        Top = 24
        Width = 128
        Height = 25
        Caption = '���� ÷��'
        TabOrder = 1
        OnClick = btnAttachFileClick
      end
      object btnDeleteFile: TButton
        Left = 12
        Top = 124
        Width = 128
        Height = 25
        Caption = '÷������ ����'
        TabOrder = 2
        OnClick = btnDeleteFileClick
      end
      object tbFileIndexID: TEdit
        Left = 12
        Top = 98
        Width = 128
        Height = 21
        ImeName = '�ѱ��� �Է� �ý��� (IME 2000)'
        TabOrder = 3
      end
    end
    object GroupBox5: TGroupBox
      Left = 183
      Top = 360
      Width = 162
      Height = 209
      Caption = '���� ����'
      TabOrder = 2
      object btnGetDetailInfo: TButton
        Left = 12
        Top = 81
        Width = 135
        Height = 25
        Caption = '������ Ȯ��'
        TabOrder = 0
        OnClick = btnGetDetailInfoClick
      end
      object btnGetLogs: TButton
        Left = 12
        Top = 139
        Width = 135
        Height = 25
        Caption = '���� �����̷� Ȯ��'
        TabOrder = 1
        OnClick = btnGetLogsClick
      end
      object btnGetInfo: TButton
        Left = 12
        Top = 24
        Width = 135
        Height = 25
        Caption = '���� Ȯ��'
        TabOrder = 2
        OnClick = btnGetInfoClick
      end
      object btnGetInfos: TButton
        Left = 12
        Top = 54
        Width = 135
        Height = 25
        Caption = '���� �뷮 Ȯ��'
        TabOrder = 3
        OnClick = btnGetInfosClick
      end
      object btnSearch: TButton
        Left = 12
        Top = 110
        Width = 135
        Height = 25
        Caption = '��� ��ȸ'
        TabOrder = 4
        OnClick = btnSearchClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 896
      Top = 360
      Width = 350
      Height = 209
      Caption = '�ΰ����'
      TabOrder = 3
      object btnSendEmail: TButton
        Left = 12
        Top = 24
        Width = 154
        Height = 25
        Caption = '�̸��� ����'
        TabOrder = 0
        OnClick = btnSendEmailClick
      end
      object btnSendSMS: TButton
        Left = 12
        Top = 54
        Width = 154
        Height = 25
        Caption = '���� ����'
        TabOrder = 1
        OnClick = btnSendSMSClick
      end
      object btnSendFax: TButton
        Left = 12
        Top = 83
        Width = 154
        Height = 25
        Caption = '�ѽ� ����'
        TabOrder = 2
        OnClick = btnSendFaxClick
      end
      object btnDetachStatement: TButton
        Left = 12
        Top = 142
        Width = 154
        Height = 25
        Caption = '���ڸ��� ÷������'
        TabOrder = 3
        OnClick = btnDetachStatementClick
      end
      object btnAttachStatement: TButton
        Left = 12
        Top = 113
        Width = 154
        Height = 25
        Caption = '���ڸ��� ÷��'
        TabOrder = 4
        OnClick = btnAttachStatementClick
      end
      object btnAssignMgtKey: TButton
        Left = 172
        Top = 24
        Width = 165
        Height = 25
        Caption = '������ȣ �Ҵ�'
        TabOrder = 5
        OnClick = btnAssignMgtKeyClick
      end
      object btnListEmailConfig: TButton
        Left = 172
        Top = 54
        Width = 165
        Height = 25
        Caption = '�˸����� ���۸�� ��ȸ'
        TabOrder = 6
        OnClick = btnListEmailConfigClick
      end
      object btnUpdateEmailConfig: TButton
        Left = 172
        Top = 83
        Width = 165
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
      Left = 457
      Top = 18
      Width = 161
      Height = 31
      Caption = '������ȣ ��뿩�� Ȯ��'
      TabOrder = 5
      OnClick = btnCheckMgtKeyInUseClick
    end
    object GroupBox10: TGroupBox
      Left = 357
      Top = 360
      Width = 152
      Height = 209
      Caption = '��Ÿ  URL'
      TabOrder = 6
      object btnGetURL1: TButton
        Left = 12
        Top = 24
        Width = 127
        Height = 25
        Caption = '�ӽ�(����) ������'
        TabOrder = 0
        OnClick = btnGetURL1Click
      end
      object btnGetURL2: TButton
        Left = 12
        Top = 54
        Width = 127
        Height = 25
        Caption = '���� ������'
        TabOrder = 1
        OnClick = btnGetURL2Click
      end
      object btnGetURL3: TButton
        Left = 12
        Top = 83
        Width = 127
        Height = 25
        Caption = '���� ������'
        TabOrder = 2
        OnClick = btnGetURL3Click
      end
      object btnGetURL4: TButton
        Left = 12
        Top = 113
        Width = 127
        Height = 25
        Caption = '���� �����ۼ�'
        TabOrder = 3
        OnClick = btnGetURL4Click
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
      Left = 952
      Top = 96
      Width = 257
      Height = 193
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
        Caption = '���'
        TabOrder = 0
        OnClick = btnRegister_reverseClick
      end
      object btnUpdate_reverse: TButton
        Left = 152
        Top = 28
        Width = 49
        Height = 27
        Caption = '����'
        TabOrder = 1
        OnClick = btnUpdate_reverseClick
      end
      object btnCancelIssue_reverse_sub: TButton
        Left = 24
        Top = 152
        Width = 60
        Height = 27
        Caption = '�������'
        TabOrder = 2
        OnClick = btnCancelIssue_subClick
      end
      object btnDelete_reverse_sub: TButton
        Left = 164
        Top = 152
        Width = 65
        Height = 27
        Caption = '����'
        TabOrder = 3
        OnClick = btnDelete_subClick
      end
      object btnIssue_reverse_sub: TButton
        Left = 24
        Top = 114
        Width = 60
        Height = 27
        Caption = '����'
        TabOrder = 4
        OnClick = btnIssueClick
      end
      object btnCancelRequest_sub: TButton
        Left = 164
        Top = 74
        Width = 65
        Height = 27
        Caption = '��û���'
        TabOrder = 5
        OnClick = btnCancelRequest_subClick
      end
      object btnRequest: TButton
        Left = 24
        Top = 74
        Width = 121
        Height = 27
        Caption = '�����û'
        TabOrder = 6
        OnClick = btnRequestClick
      end
      object btnRefuse_sub2: TButton
        Left = 96
        Top = 114
        Width = 60
        Height = 27
        Caption = '�ź�'
        TabOrder = 7
        OnClick = btnRefuse_sub2Click
      end
    end
    object btnGetEmailPublicKey: TButton
      Left = 1080
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
      Left = 96
      Top = 296
      Width = 185
      Height = 33
      Caption = '����û �������'
      TabOrder = 10
      OnClick = btnSendToNTSClick
    end
    object btnRegistIssue: TButton
      Left = 64
      Top = 137
      Width = 76
      Height = 26
      Caption = '��ù���'
      TabOrder = 11
      OnClick = btnRegistIssueClick
    end
    object btnCancelIssue: TButton
      Left = 64
      Top = 200
      Width = 73
      Height = 27
      Caption = '�������'
      TabOrder = 12
      OnClick = btnCancelIssueClick
    end
    object btnDelete: TButton
      Left = 176
      Top = 200
      Width = 65
      Height = 25
      Caption = '����'
      TabOrder = 13
      OnClick = btnDeleteClick
    end
    object GroupBox7: TGroupBox
      Left = 518
      Top = 360
      Width = 372
      Height = 209
      Caption = '���ݰ�꼭 ����/�μ�'
      TabOrder = 15
      object btnGetPopUpURL: TButton
        Left = 12
        Top = 24
        Width = 164
        Height = 25
        Caption = '���ݰ�꼭 ���� URL'
        TabOrder = 0
        OnClick = btnGetPopUpURLClick
      end
      object btnGetPrintURL: TButton
        Left = 12
        Top = 81
        Width = 164
        Height = 25
        Caption = '������ �μ� �˾� URL'
        TabOrder = 1
        OnClick = btnGetPrintURLClick
      end
      object btnGetMassPrintURL: TButton
        Left = 12
        Top = 172
        Width = 164
        Height = 25
        Caption = '�뷮 �μ� �˾� URL'
        TabOrder = 2
        OnClick = btnGetMassPrintURLClick
      end
      object btnGetMailURL: TButton
        Left = 184
        Top = 24
        Width = 180
        Height = 25
        Caption = '���ϸ�ũ URL'
        TabOrder = 3
        OnClick = btnGetMailURLClick
      end
      object btnGetEPrintUrl: TButton
        Left = 12
        Top = 142
        Width = 164
        Height = 25
        Caption = '���޹޴��� �μ� �˾� URL'
        TabOrder = 4
        OnClick = btnGetEPrintUrlClick
      end
      object btnGetViewURL: TButton
        Left = 12
        Top = 53
        Width = 164
        Height = 25
        Caption = '���ݰ�꼭 ���� URL(�޴�x)'
        TabOrder = 5
        OnClick = btnGetViewURLClick
      end
      object btnGetPDFURL: TButton
        Left = 184
        Top = 53
        Width = 180
        Height = 25
        Caption = '���ݰ�꼭 PDF �ٿ�ε� URL'
        TabOrder = 6
        OnClick = btnGetPDFURLClick
      end
      object btnGetOldPrintURL: TButton
        Left = 12
        Top = 112
        Width = 164
        Height = 25
        Caption = '(��) ������ �μ� �˾� URL'
        TabOrder = 7
        OnClick = btnGetOldPrintURLClick
      end
    end
    object btnRegistRequest: TButton
      Left = 768
      Top = 124
      Width = 81
      Height = 25
      Caption = '��ÿ�û'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      OnClick = btnRegistRequestClick
    end
  end
  object GroupBox8: TGroupBox
    Left = 8
    Top = 40
    Width = 1273
    Height = 185
    Caption = '�˺� �⺻ API'
    TabOrder = 1
    object GroupBox9: TGroupBox
      Left = 16
      Top = 24
      Width = 137
      Height = 122
      Caption = 'ȸ������'
      TabOrder = 0
      object btnJoinMember: TButton
        Left = 8
        Top = 88
        Width = 120
        Height = 25
        Caption = '����ȸ�� �ű԰���'
        TabOrder = 0
        OnClick = btnJoinMemberClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 120
        Height = 25
        Caption = '���Կ��� Ȯ��'
        TabOrder = 1
        OnClick = btnCheckIsMemberClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = '���̵� �ߺ� Ȯ��'
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
        Caption = '���� �ܰ� Ȯ��'
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
        Top = 56
        Width = 129
        Height = 25
        Caption = '������ ������ Ȯ��'
        TabOrder = 0
        OnClick = btnGetCertificateExpireDateClick
      end
      object btnGetTaxCertURL: TButton
        Left = 6
        Top = 24
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
      Height = 153
      Caption = '����� ����'
      TabOrder = 4
      object btnUpdateContact: TButton
        Left = 8
        Top = 120
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
        Top = 88
        Width = 129
        Height = 25
        Caption = '����� ��� ��ȸ'
        TabOrder = 2
        OnClick = btnListContactClick
      end
      object btnGetContactInfo: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = '����� ���� Ȯ��'
        TabOrder = 3
        OnClick = btnGetContactInfoClick
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
    Height = 153
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
      Left = 8
      Top = 56
      Width = 128
      Height = 25
      Caption = '����Ʈ ���� URL'
      TabOrder = 1
      OnClick = btnGetChargeURLClick
    end
    object btnGetPaymentURL: TButton
      Left = 8
      Top = 88
      Width = 128
      Height = 25
      Caption = '����Ʈ �������� URL'
      TabOrder = 2
      OnClick = btnGetPaymentURLClick
    end
    object btnGetUseHistoryURL: TButton
      Left = 8
      Top = 120
      Width = 128
      Height = 25
      Caption = '����Ʈ ��볻�� URL'
      TabOrder = 3
      OnClick = btnGetUseHistoryURLClick
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
      Caption = '�ܿ�����Ʈ Ȯ��'
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