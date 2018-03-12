{******************************************************************************}
{ 팝빌 전자세금계산서 API Delphi SDK Example                                   }
{                                                                              }
{ - 델파이 SDK 적용방법 안내 : http://blog.linkhub.co.kr/572                   }
{ - 업데이트 일자 : 2017-12-05                                                 }
{ - 연동 기술지원 연락처 : 1600-9854 / 070-4304-2991                           }
{ - 연동 기술지원 이메일 : code@linkhub.co.kr                                  }
{                                                                              }
{ <테스트 연동개발 준비사항>                                                   }
{ (1) 37, 40번 라인에 선언된 링크아이디(LinkID)와 비밀키(SecretKey)를          }
{    링크허브 가입시 메일로 발급받은 인증정보로 수정                           }
{ (2) 팝빌 개발용 사이트(test.popbill.com)에 연동회원으로 가입                 }
{ (3) 전자세금계산서 발행을 위해 공인인증서 등록                               }
{    - 팝빌사이트 로그인 > [전자세금계산서] 선택 > 왼쪽 하단탭                 }
{      [환경설정] > [공인인증서 관리] 메뉴 이용                                }
{    - 공인인증서등록 팝업 URL (GetPopbillURL API)을 이용하여 등록             }
{                                                                              }
{******************************************************************************}

unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillTaxinvoice, ExtCtrls;

const
        {**********************************************************************}
        { - 인증정보(링크아이디, 비밀키)는 파트너의 연동회원을 식별하는        }
        {   인증에 사용되므로 유출되지 않도록 주의하시기 바랍니다              }
        { - 상업용 전환이후에도 인증정보는 변경되지 않습니다.                  }
        {**********************************************************************}

        // 링크아이디.
        LinkID = 'TESTER';
        
        // 파트너 통신용 비밀키. 유출 주의.
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';

type
  TfrmExample = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Shape3: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape2: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape7: TShape;
    Shape6: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape1: TShape;
    Shape12: TShape;
    Label6: TLabel;
    Label7: TLabel;
    btnRegister: TButton;
    btnUpdate: TButton;
    btnSend: TButton;
    btnCancel_Issue: TButton;
    btnDelete: TButton;
    btnIssue: TButton;
    btnAccept: TButton;
    btnDeny: TButton;
    btnCancel_Send: TButton;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    btnGetFileList: TButton;
    btnAttachFile: TButton;
    btnDeleteFile: TButton;
    tbFileIndexID: TEdit;
    GroupBox5: TGroupBox;
    btnGetDetailInfo: TButton;
    btnGetLogs: TButton;
    btnGetInfo: TButton;
    btnGetInfos: TButton;
    GroupBox6: TGroupBox;
    btnReSendEmail: TButton;
    btnReSendSMS: TButton;
    btnSendInvoiceFax: TButton;
    tbMgtKey: TEdit;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoin: TButton;
    GroupBox11: TGroupBox;
    btnGetUnitCost: TButton;
    GroupBox12: TGroupBox;
    btnGetPopBillURL: TButton;
    GroupBox14: TGroupBox;
    btnGetCertificateExpireDate: TButton;
    GroupBox7: TGroupBox;
    btnGetPopUpURL: TButton;
    btnGetPrintURL: TButton;
    btnGetPrintsURL: TButton;
    btnGetMailURL: TButton;
    txtCorpNum: TEdit;
    Label3: TLabel;
    btnCheckMgtKeyInUse: TButton;
    Label4: TLabel;
    txtUserID: TEdit;
    GroupBox10: TGroupBox;
    btnGetTaxinvoiceURL1: TButton;
    btnGetTaxinvoiceURL2: TButton;
    btnGetTaxinvoiceURL3: TButton;
    btnGetTaxinvoiceURL4: TButton;
    OpenDialog1: TOpenDialog;
    cbMgtKeyType: TComboBox;
    GroupBox13: TGroupBox;
    Shape15: TShape;
    Shape16: TShape;
    Shape18: TShape;
    Shape23: TShape;
    Label5: TLabel;
    btnRegister_Reverse: TButton;
    btnUpdate_Reverse: TButton;
    btnCancelIssue_Reverse: TButton;
    btnDelete_Reverse: TButton;
    btnIssue_Reverse: TButton;
    btnCancelRequest: TButton;
    btnRequest: TButton;
    btnRefuse: TButton;
    Shape13: TShape;
    Shape14: TShape;
    Shape17: TShape;
    btnGetEmailPublicKey: TButton;
    btnSendToNTS: TButton;
    btnGetEPrintUrl: TButton;
    Button1: TButton;
    btnRegistIssue: TButton;
    btnCancelIssue: TButton;
    btnDelete_RegistIssue: TButton;
    GroupBox15: TGroupBox;
    Shape19: TShape;
    Shape20: TShape;
    GroupBox4: TGroupBox;
    GroupBox16: TGroupBox;
    Shape21: TShape;
    btnUpdateContact: TButton;
    btnRegistContact: TButton;
    btnCheckID: TButton;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    btnListContact: TButton;
    btnSearchInfo: TButton;
    btnDetachStatement: TButton;
    btnAttachStatement: TButton;
    btnGetChargeInfo: TButton;
    btnGetPopbillURL_SEAL: TButton;
    GroupBox17: TGroupBox;
    GroupBox18: TGroupBox;
    btnGetBalance: TButton;
    btnGetPopbillURL_CHRG: TButton;
    btnGetPartnerBalance: TButton;
    btnGetPopbillURL_CERT: TButton;
    btnGetPartnerURL_CHRG: TButton;
    btnAssignMgtKey: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action:TCloseAction);
    procedure btnGetPopBillURLClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetCertificateExpireDateClick(Sender: TObject);
    procedure btnGetUnitCostClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAttachFileClick(Sender: TObject);
    procedure btnGetFileListClick(Sender: TObject);
    procedure btnDeleteFileClick(Sender: TObject);
    procedure btnGetInfoClick(Sender: TObject);
    procedure btnGetInfosClick(Sender: TObject);
    procedure btnGetLogsClick(Sender: TObject);
    procedure cbMgtKeyTypeChange(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnCancel_SendClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure btnDenyClick(Sender: TObject);
    procedure btnCancel_IssueClick(Sender: TObject);
    procedure btnIssueClick(Sender: TObject);
    procedure btnSendToNTSClick(Sender: TObject);
    procedure btnRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure btnRefuseClick(Sender: TObject);
    procedure btnReSendSMSClick(Sender: TObject);
    procedure btnReSendEmailClick(Sender: TObject);
    procedure btnSendInvoiceFaxClick(Sender: TObject);
    procedure btnGetTaxinvoiceURL1Click(Sender: TObject);
    procedure btnGetTaxinvoiceURL2Click(Sender: TObject);
    procedure btnGetTaxinvoiceURL3Click(Sender: TObject);
    procedure btnGetTaxinvoiceURL4Click(Sender: TObject);
    procedure btnGetPopUpURLClick(Sender: TObject);
    procedure btnGetPrintURLClick(Sender: TObject);
    procedure btnGetMailURLClick(Sender: TObject);
    procedure btnGetPrintsURLClick(Sender: TObject);
    procedure btnGetEmailPublicKeyClick(Sender: TObject);
    procedure btnRegister_ReverseClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnUpdate_ReverseClick(Sender: TObject);
    procedure btnGetDetailInfoClick(Sender: TObject);
    procedure btnCheckMgtKeyInUseClick(Sender: TObject);
    procedure btnGetEPrintUrlClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnListContactClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnRegistIssueClick(Sender: TObject);
    procedure btnCancelIssueClick(Sender: TObject);
    procedure btnDelete_RegistIssueClick(Sender: TObject);
    procedure btnGetPopbillURL_CHRGClick(Sender: TObject);
    procedure btnGetPopbillURL_CERTClick(Sender: TObject);
    procedure btnSearchInfoClick(Sender: TObject);
    procedure btnAttachStatementClick(Sender: TObject);
    procedure btnDetachStatementClick(Sender: TObject);
    procedure btnGetChargeInfoClick(Sender: TObject);
    procedure btnGetPopbillURL_SEALClick(Sender: TObject);
    procedure btnGetPartnerURL_CHRGClick(Sender: TObject);
    procedure btnAssignMgtKeyClick(Sender: TObject);
  private
    MgtKeyType : EnumMgtKeyType;
  public
    { Public declarations }
  end;

var
  frmExample: TfrmExample;
  taxinvoiceService : TTaxinvoiceService;
implementation

{$R *.DFM}

procedure TfrmExample.FormCreate(Sender: TObject);
begin
        MgtKeyType := SELL;
        
        //세금계산서 모듈 초기화.
        taxinvoiceService := TTaxinvoiceService.Create(LinkID,SecretKey);

        //연동환경 설정값, true(개발용), false(상업용)
        taxinvoiceService.IsTest := true;
        
        //Exception 처리 설정값. 미기재시 true(기본값)
        taxinvoiceService.IsThrowException := true;
end;

procedure TfrmExample.FormClose(Sender:TObject; var Action:TCloseAction);
begin
        taxinvoiceService.Free;
        Action := caFree;
end;

function IfThen(condition :bool; trueVal :String ; falseVal : String) : string;
begin
    if condition then result := trueVal else result := falseVal;
end;

Function BoolToStr(b:Boolean):String;
begin
    if b = true then BoolToStr:='True';
    if b = false then BoolToStr:='False';
end;

procedure TfrmExample.btnGetPopBillURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        {    팝빌(www.popbill.com)에 로그인된 팝업 URL을 반환합니다.           }
        {    URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.      }
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getPopbillURL(txtCorpNum.Text, 'LOGIN');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;



procedure TfrmExample.btnJoinClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        {    파트너의 연동회원으로 회원가입을 요청합니다.                      }
        {    아이디 중복확인은 btnCheckIDClick 프로시져를 참조하시기 바랍니다. }
        {**********************************************************************}

        // 링크아이디
        joinInfo.LinkID := LinkID;

        // 사업자번호 '-' 제외, 10자리
        joinInfo.CorpNum := '4364364364';

        // 대표자성명, 최대 30자
        joinInfo.CEOName := '대표자성명';

        // 상호명, 최대 70자
        joinInfo.CorpName := '링크허브';

        // 주소, 최대 300자
        joinInfo.Addr := '주소';

        // 업태, 최대 40자
        joinInfo.BizType := '업태';

        // 종목, 최대 40자
        joinInfo.BizClass := '종목';

        // 아이디, 6자이상 20자 미만
        joinInfo.ID     := 'userid';

        // 비밀번호, 6자이상 20자 미만
        joinInfo.PWD    := 'pwd_must_be_long_enough';

        // 담당자명, 최대 30자
        joinInfo.ContactName := '담당자명';

        // 담당자 연락처, 최대 20자
        joinInfo.ContactTEL :='070-4304-2991';

        // 담당자 휴대폰번호, 최대 20자
        joinInfo.ContactHP := '010-000-1111';

        // 담당자 팩스번호, 최대 20자
        joinInfo.ContactFAX := '02-6442-9700';

        // 담당자 메일, 최대 70자
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := taxinvoiceService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnRegisterClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin

        {**********************************************************************}
        { - 세금계산서 임시저장(Register API) 호출후에는 발행(Issue API)을     }
        {   호출해야만 국세청으로 전송됩니다.                                  }
        { - 임시저장과 발행을 한번의 호출로 처리하는 즉시발행(RegistIssue API) }
        {   프로세스를 권장합니다.                                             }
        { - 세금계산서 항목별 정보는 "[전자세금계산서 API 연동매뉴얼] >        }
        {   4.1 (세금)계산서 구성" 을 참조하시기 바랍니다.                     }
        {**********************************************************************}

        
        // 세금계산서 객체 생성
        taxinvoice := TTaxinvoice.Create;

        // [필수] 작성일자, 표시형식 (yyyyMMdd) ex)20161004
        taxinvoice.writeDate := '20170222';

        // [필수] 발행형태, [정발행, 역발행, 위수탁] 중 기재
        taxinvoice.issueType := '정발행';

        // [필수] [정과금, 역과금] 중 기재, '역과금' 은 역발행 프로세스에서만 이용가능
        // 정과금(공급자 과금), 역과금(공급받는자 과금)
        taxinvoice.chargeDirection := '정과금';

        // [필수] 영수/청구, [영수, 청구] 중 기재
        taxinvoice.purposeType := '영수';

        // [필수] 발행시점, [직접발행, 승인시자동발행] 중 기재
        // 발행예정(Send API) 프로세스를 구현하지 않는경우 '직접발행' 기재
        taxinvoice.issueTiming := '직접발행';         

        // [필수] 과세형태, [과세, 영세, 면세] 중 기재
        taxinvoice.taxType :='과세';


        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // [필수] 공급자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoicerCorpNum := '1234567890';

        // [필수] 공급자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoicerTaxRegID := '';

        // [필수] 공급자 상호
        taxinvoice.invoicerCorpName := '공급자 상호';

        // [필수] 공급자 문서관리번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoicerMgtKey := tbMgtKey.Text;

        // [필수] 공급자 대표자 성명
        taxinvoice.invoicerCEOName := '공급자 대표자 성명';

        // 공급자 주소
        taxinvoice.invoicerAddr := '공급자 주소';

        // 공급자 종목
        taxinvoice.invoicerBizClass := '공급자 업종';

        // 공급자 업태
        taxinvoice.invoicerBizType := '공급자 업태,업태2';

        // 공급자 담당자명
        taxinvoice.invoicerContactName := '공급자 담당자명';

        // 공급자 담당자 메일주소
        taxinvoice.invoicerEmail := 'test@test.com';

        // 공급자 담당자 연락처
        taxinvoice.invoicerTEL := '070-4304-2991';

        // 공급자 담당자 휴대폰 번호
        taxinvoice.invoicerHP := '010-0000-2222';

        // 정발행시 공급받는자에게 발행안내문자 전송여부
        taxinvoice.invoicerSMSSendYN := false;


        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // [필수] 공급받는자 구분, [사업자, 개인, 외국인] 중 기재
        taxinvoice.invoiceeType := '사업자';

        // [필수] 공급받는자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoiceeCorpNum := '8888888888';

        // [필수] 공급받는자 종사업장 식별번호, 필요시 숫자 4자리 기재        
        taxinvoice.invoiceeTaxRegID := '';

        // [필수] 공급받는자 상호
        taxinvoice.invoiceeCorpName := '공급받는자 상호';

        // [역발행시 필수] 공급받는자 문서관리번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoiceeMgtKey := '';

        // [필수] 공급받는자 대표자 성명
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        taxinvoice.invoiceeAddr := '공급받는자 주소';

        // 공급받는자 종목
        taxinvoice.invoiceeBizClass := '공급받는자 업종';

        // 공급받는자 업태
        taxinvoice.invoiceeBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';

        // 공급받는자 메일주소
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // 공급받는자 연락처
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // 공급받는자 휴대폰번호
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // 역발행시 공급자에게 발행안내문자 전송여부
        taxinvoice.invoiceeSMSSendYN := false;

        
        {**********************************************************************}
        {                           세금계산서 정보                            }
        {**********************************************************************}

        // [필수] 공급가액 합계
        taxinvoice.supplyCostTotal := '200000';

        // [필수] 세액 합계
        taxinvoice.taxTotal := '20000';

        // [필수] 합계금액, (공급가액 합계 + 세액합계)
        taxinvoice.totalAmount := '220000';

        // 기재 상 '일련번호' 항목
        taxinvoice.serialNum := '';

        // 기재 상 '권' 항목, 최대값 32767
        taxinvoice.kwon := '1';

        // 기재 상 '호' 항목, 최대값 32767
        taxinvoice.ho := '1';
        
        // 기재 상 '현금' 항목
        taxinvoice.cash := '';

        // 기재 상 '수표' 항목
        taxinvoice.chkBill := '';

        // 기재 상 '어음' 항목
        taxinvoice.note := '';

        // 기재 상 '외상미수금' 항목
        taxinvoice.credit := '';

        // 기재 상 '비고' 항목
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';

        // 사업자등록증 이미지 첨부여부                                                
        taxinvoice.businessLicenseYN := false;

        // 통장사본 이미지 첨부여부 
        taxinvoice.bankBookYN := false;
        

        {**********************************************************************}
        {         수정세금계산서 정보 (수정세금계산서 작성시에만 기재          }
        {   수정세금계산서 관련 정보는 연동매뉴얼 또는 개발가이드 링크 참조    }
        { [참고] 수정세금계산서 작성방법 안내 - http://blog.linkhub.co.kr/650  }
        {**********************************************************************}

        // 수정사유코드, 수정사유별로 1~6중 선택기재 
        taxinvoice.modifyCode := '';

        // 원본세금계산서의 ItemKey, 문서확인 (GetInfo API)의 응답결과(ItemKey 항목) 확인.
        taxinvoice.originalTaxinvoiceKey := '';

        
        {**********************************************************************}
        {                        상세항목(품목) 정보                           }
        {**********************************************************************}

        // 상세항목 0~99개 까지 작성가능.
        // 일련번호 (serialNum) 는 1부터 99까지 순차기재.
        // SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //일련번호
        taxinvoice.detailList[0].purchaseDT := '20161004';      //거래일자
        taxinvoice.detailList[0].itemName := '품목명';
        taxinvoice.detailList[0].spec := '규격';
        taxinvoice.detailList[0].qty := '1';                    //수량
        taxinvoice.detailList[0].unitCost := '100000';          //단가
        taxinvoice.detailList[0].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[0].tax := '10000';                //세액
        taxinvoice.detailList[0].remark := '비고';

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //일련번호
        taxinvoice.detailList[1].purchaseDT := '20161004';      //거래일자
        taxinvoice.detailList[1].itemName := '품목명2';
        taxinvoice.detailList[1].spec := '규격';
        taxinvoice.detailList[1].qty := '1';                    //수량
        taxinvoice.detailList[1].unitCost := '100000';          //단가
        taxinvoice.detailList[1].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[1].tax := '10000';                //세액
        taxinvoice.detailList[1].remark := '비고';


        {**********************************************************************}
        {                           추가담당자 정보                            }
        { 세금계산서 발행안내메일을 수신받아야 하는 담당자가 다수인 경우 추가로}
        { 담당자 정보를 기재하여 발행안내메일을 전송받을수 있습니다.           }
        {**********************************************************************}

        // 추가담당자 배열초기화, 최대 5개까지 기재 가능
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // 일련번호, 1부터 순차기재
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';     // 메일주소
        taxinvoice.addContactList[0].contactName := '추가담당자명';     // 담당자명

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].serialNum := 2;    //일련번호, 1부터 순차기재
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';     // 메일주소
        taxinvoice.addContactList[1].contactName := '추가담당자명2';    // 담당자명

        try
                response := taxinvoiceService.Register(txtCorpNum.text, taxinvoice, txtUserID.Text);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 연동회원의 잔여포인트를 확인합니다. 과금방식이 연동과금이 아닌       }
        { 파트너과금인 경우 파트너 잔여포인트 확인(GetPartnerBalance API)를    }
        { 이용하시기 바랍니다                                                  }
        {**********************************************************************}
        
        try
                balance := taxinvoiceService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnGetCertificateExpireDateClick(Sender: TObject);
var
        Expired : String;
begin
        {**********************************************************************}
        { 팝빌에 등록되어있는 공인인증서의 만료일자를 반환합니다.              }
        { 등록된 공인인증서가 갱신/재발급/비밀번호변경 되는 경우 인증서를      }
        { 재등록 하셔야 정상적으로 API를 이용하실 수 있습니다.                 }  
        {**********************************************************************}

        try
                Expired := taxinvoiceService.GetCertificateExpireDate(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('인증서 만료일 : '+ Expired);

end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { 전자세금계산서 발행시 차감되는 포인트 단가를 반환합니다.             }
        {**********************************************************************}

        try
                unitcost := taxinvoiceService.GetUnitCost(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('세금계산서 발행단가 : '+ FloatToStr(unitcost));
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin

        {**********************************************************************}
        { 파트너의 잔여포인트를 확인합니다. 과금방식이 파트너과금이 아닌       }
        { 연동과금인 경우 연동회원 잔여포인트 확인(GetBalance API)를           }
        { 이용하시기 바랍니다                                                  }
        {**********************************************************************}

        try
                balance := taxinvoiceService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnDeleteClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 1건의 전자세금계산서를 [삭제]합니다. 세금계산서가 삭제된 경우에만    } 
        { 문서관리번호(mgtKey)를 재사용 할 수 있습니다.                        }
        { - 삭제가능한 문서 상태 : [임시저장], [발행취소], [취소], [거부]      }
        {**********************************************************************}
        
        try
                response := taxinvoiceService.Delete(txtCorpNum.text, MgtKeyType,
                                                        tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);

end;

procedure TfrmExample.btnAttachFileClick(Sender: TObject);
var
        filePath : string;
        response : TResponse;
begin
        {**********************************************************************}
        { - 세금계산서의 첨부파일 등록은 [임시저장] 상태에서만 가능합니다.     }
        {   [발행완료]상태에서는 첨부파일을 등록 할 수 없습니다.               }
        { - 첨부파일은 최대 5개까지 추가할 수 있습니다.                        }
        {**********************************************************************}

        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        try
                response := taxinvoiceService.AttachFile(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, filePath);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);

end;                                                 

procedure TfrmExample.btnGetFileListClick(Sender: TObject);
var
        fileList : TAttachedFileList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 전자세금계산서에 첨부된 파일의 목록을 확인합니다.                    }
        { - 응답항목 중 파일아이디(AttachedFile)는 파일 삭제(DeleteFile API)   }
        {   호출시 이용할 수 있습니다.                                         }
        {**********************************************************************}
        
        try
                filelist := taxinvoiceService.GetFiles(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'SerialNum(일련번호) | DisplayName(파일명) | AttachedFile(파일아이디) | RegDT(등록일시)' + #13;

        for i := 0 to Length(fileList) -1 do
        begin
            tmp := tmp +  IntToStr(fileList[i].SerialNum) + ' | '
                        + fileList[i].DisplayName + ' | '
                        + fileList[i].AttachedFile + ' | '
                        + fileList[i].RegDT + #13;
                        
            tbFileIndexID.Text := fileList[i].AttachedFile;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnDeleteFileClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 세금계산서에 첨부된 파일을 삭제합니다.                               }
        { 파일아이디는 파일목록 (GetFiles API)의 응답항목중 파일아이디         }
        { (AttachedFile) 값을 확인하여 DeleteFile API 호출시 기재하시면 됩니다.}
        {**********************************************************************}

        try
                response := taxinvoiceService.DeleteFile(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, tbFileIndexID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnGetInfoClick(Sender: TObject);
var
        taxinvoiceInfo : TTaxinvoiceInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 1건의 세금계산서 상태/요약 정보를 확인합니다                         }
        { - 세금계산서 상태정보(GetInfo API) 응답항목에 대한 자세한 정보는     }
        {  "[전자세금계산서 API 연동매뉴얼] > 4.2. (세금)계산서 상태정보 구성" }
        {  을 참조하시기 바랍니다.                                             }
        {**********************************************************************}
        
        try
                taxinvoiceInfo := taxinvoiceService.getInfo(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'ItemKey | modifyCode | StateCode | TaxType | WriteDate | RegDT | OpenYN | OpenDT | lateIssueYN | InvoicerPrintYN | InvoiceePrintYN | closeDownState | closeDownStateDate | interOPYN ' + #13;

        tmp := tmp + taxinvoiceInfo.ItemKey + ' | '
                + taxinvoiceInfo.ModifyCode + ' | '
                + IntToStr(taxinvoiceInfo.StateCode) + ' | '
                + taxinvoiceInfo.TaxType + ' | '
                + taxinvoiceInfo.WriteDate + ' | '
                + taxinvoiceInfo.RegDT + ' | '
                + BoolToStr(taxinvoiceInfo.OpenYN) + ' | '
                + taxinvoiceInfo.OpenDT + ' | '
                + BoolToStr(taxinvoiceInfo.lateIssueYN) + ' | '
                + BoolToStr(taxinvoiceInfo.InvoicerPrintYN) + ' | '
                + BoolToStr(taxinvoiceInfo.InvoiceePrintYN) + ' | '
                + IntToStr(taxinvoiceInfo.closeDownState) + ' | '
                + taxinvoiceInfo.closeDownStateDate + ' | '
                + BoolToStr(taxinvoiceInfo.interOPYN)  + #13;
                
        ShowMessage(tmp);

end;

procedure TfrmExample.btnGetInfosClick(Sender: TObject);
var
        KeyList : Array of String;
        InfoList : TTaxinvoiceInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 다량의 세금계산서 상태/요약 정보를 확인합니다. (최대 1000건)         }
        { - 세금계산서 상태정보(GetInfos API) 응답항목에 대한 자세한 정보는    }
        {  "[전자세금계산서 API 연동매뉴얼] > 4.2. (세금)계산서 상태정보 구성" }
        {  을 참조하시기 바랍니다.                                             }
        {**********************************************************************}

        // 세금계산서 문서관리번호 배열, 최대 1000건까지 기재가능
        SetLength(KeyList,2);
        KeyList[0] := '20161221-03';
        KeyList[1] := '20161004-02';
        
        try
                InfoList := taxinvoiceService.getInfos(txtCorpNum.text, MgtKeyType, KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'ItemKey | StateCode | TaxType | WriteDate | RegDT | lateIssueYN | InvoicerPrintYN | InvoiceePrintYN | closeDownState | closeDownStateDate | interOPYN' + #13;

        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].ItemKey + ' | '
                        + IntToStr(InfoList[i].StateCode) + ' | '
                        + InfoList[i].TaxType + ' | '
                        + InfoList[i].WriteDate + ' | '
                        + InfoList[i].RegDT + ' | '
                        + BoolToStr(InfoList[i].lateIssueYN) + ' | '
                        + BoolToStr(InfoList[i].InvoicerPrintYN) + ' | '
                        + BoolToStr(InfoList[i].InvoiceePrintYN) + ' | '
                        + IntToStr(InfoList[i].closeDownState) + ' | '
                        + InfoList[i].closeDownStateDate + ' | '
                        + BoolToStr(InfoList[i].interOPYN)  + #13;
        end;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnGetLogsClick(Sender: TObject);
var
        LogList : TTaxinvoiceLogList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 세금계산서 상태 변경이력을 확인합니다                                }
        { - 상태 변경이력 확인(GetLogs API) 응답항목에 대한 자세한 정보는      }
        {  "[전자세금계산서 API 연동매뉴얼] > 3.6.4 상태 변경이력 확인"        }
        {  을 참조하시기 바랍니다.                                             }
        {**********************************************************************}
        
        try
                LogList := taxinvoiceService.getLogs(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'DocLogType | Log | ProcType | ProcCorpName | ProcMemo | RegDT | IP' + #13;
        
        for i := 0 to Length(LogList) -1 do
        begin
            tmp := tmp + IntToStr(LogList[i].DocLogType) + ' | '
                        + LogList[i].Log + ' | '
                        + LogList[i].ProcType + ' | '
                        + LogList[i].ProcCorpName + ' | '
                        + LogList[i].ProcMemo + ' | '
                        + LogList[i].RegDT + ' | '
                        + LogList[i].IP + ' | ' + #13;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.cbMgtKeyTypeChange(Sender: TObject);
begin

        MgtKeyType := EnumMgtKeyType(GetEnumValue(TypeInfo(EnumMgtKeyType),cbMgtKeyType.Text));

end;

procedure TfrmExample.btnSendClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
        emailSubject : String;
begin
        {**********************************************************************}
        { [임시저장] 상태의 세금계산서를 [발행예정] 처리합니다.                }
        { - 발행예정이란 공급자와 공급받는자 사이에 세금계산서 확인 후 발행하는}
        {   방법입니다.                                                        }
        { - "[전자세금계산서 API 연동매뉴얼] > 1.3.1. 정발행 프로세스 흐름도 > }
        {   다. 임시저장 발행예정" 의 프로세스를 참조하시기 바랍니다.          }
        {**********************************************************************}

        
        // 메모
        memo := '발행예정 메모';

        // 발행예정 안내메일 제목, 미기재시 기본제목으로 전송
        emailSubject := '';  

        try
                response := taxinvoiceService.Send(txtCorpNum.text, MgtKeyType,
                                tbMgtKey.Text, memo, emailSubject);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnCancel_SendClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 발행예정 세금계산서를 [취소]처리 합니다                              }
        { - [취소]된 세금계산서를 삭제(Delete API)하면 등록된 문서관리번호를   }
        {   재사용할 수 있습니다.                                              }
        {**********************************************************************}
        
        // 메모
        memo := '발행예정 취소 메모';
        
        try
                response := taxinvoiceService.CancelSend(txtCorpNum.text, MgtKeyType,
                                                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnAcceptClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 발행예정 세금계산서를 [승인]처리 합니다                              }
        {**********************************************************************}
        
        // 메모
        memo := '발행예정 승인 메모';

        try
                response := taxinvoiceService.Accept(txtCorpNum.text, MgtKeyType,
                                                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnDenyClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 발행예정 세금계산서를 [거부]처리 합니다                              }
        { - [거부]된 세금계산서를 삭제(Delete API)하면 등록된 문서관리번호를   }
        {   재사용할 수 있습니다.                                              }
        {**********************************************************************}

        // 메모
        memo := '발행예정 거부 메모';
        
        try
                response := taxinvoiceService.Deny(txtCorpNum.text, MgtKeyType,
                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnCancel_IssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin

        {**********************************************************************}
        { [발행완료] 상태의 세금계산서를 [발행취소] 합니다.                    }
        { - [발행취소]는 해당 세금계산서가 국세청 전송전에만 가능합니다.       }
        { - [발행취소]된 세금계산서는 국세청에 전송되지 않습니다.              }
        { - [발행취소] 세금계산서에 기재된 문서관리번호를 재사용 하기 위해서는 }
        {   삭제(Delete API)를 호출하여 [삭제] 처리 하셔야 합니다.             }
        {**********************************************************************}

        // 메모
        memo := '발행취소 메모';
        
        try
                response := taxinvoiceService.CancelIssue(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnIssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
        emailSubject : String;
        forceIssue : Boolean;
begin
        {**********************************************************************}
        { [임시저장] 상태의 세금계산서를 [발행]처리 합니다.                    }
        { - 발행(Issue API)를 호출하는 시점에서 포인트가 차감됩니다.           }
        { - [발행완료] 세금계산서는 연동회원의 국세청 전송설정에 따라          }
        {    익일/즉시전송 처리됩니다. 기본설정(익일전송)                      }
        { - 국세청 전송설정은 "팝빌 로그인" > [전자세금계산서] > [환경설정] >  }
        {   [전자세금계산서 관리] > [국세청 전송 및 지연발행 설정] 탭에서      }
        {   확인할 수 있습니다.                                                }
        { - 국세청 전송정책에 대한 사항은 "[전자세금계산서 API 연동매뉴얼] >   }
        {   1.4. 국세청 전송 정책" 을 참조하시기 바랍니다                      }
        {**********************************************************************}

        // 메모
        memo := '발행메모';
        
        // 공급받는자에게 전송되는 발행안내메일 제목, 미기재시 기본제목으로 전송
        emailSubject := '';

        // 지연발행 강제여부(forceIssue), 기본값-false
        // 발행마감일이 지난 세금계산서를 발행하는 경우, 가산세가 부과될 수 있습니다.
        // 가산세가 부과되더라도 발행을 해야하는 경우에는 forceIssue의 값을
        // true로 선언하여 발행(Issue API)를 호출하시면 됩니다.
        forceIssue := false;
        
        try
                response := taxinvoiceService.Issue(txtCorpNum.text, MgtKeyType,
                                tbMgtKey.Text, memo, emailSubject, forceIssue);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnSendToNTSClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { [발행완료] 상태의 세금계산서를 국세청으로 즉시전송 합니다.           }
        { - 국세청 즉시전송을 호출하지 않은 경우 [발행완료] 상태의 세금계산서는}
        {   발행일 기준으로 익일 오후 3시에 일괄적으로 국세청으로 전송됩니다.  }
        { - 익일전송시 전송일이 법정공휴일인 경우 다음 영업일에 전송됩니다.    }
        { - 국세청 전송에 관한 사항은 "[API 연동매뉴얼] > 1.4 국세청 전송 정책"}
        {   을 참조하시기 바랍니다                                             }
        {**********************************************************************}
        
        try
                response := taxinvoiceService.SendToNTS(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;



procedure TfrmExample.btnRequestClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 공급받는자가 공급자에게 1건의 역)발행 세금계산서를 발행요청합니다.   }
        { - 역)발행 세금계산서를 발행하기 위해서는 공급자/공급받는자가 모두    }
        {  팝빌에 회원이여야 합니다.                                           }
        { - 역)발행 요청후 공급자가 [발행] 처리시 포인트가 차감되며 역)발행    }
        {   세금계산서 항목중 과금방향(ChargeDirection) 에 기재한  값에 따라   }
        {   "정과금"-공급자과금 "역과금"-공급받는자과금 처리됩니다.            }
        {**********************************************************************}

        // 메모
        memo := '(역)발행 요청 메모';

        try
                response := taxinvoiceService.Request(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnCancelRequestClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 공급받는자가 요청한 1건의 역)발행 세금계산서를 [취소] 처리합니다.    }
        { - [취소]처리 된 세금계산서의 문서관리번호를 재사용 하기 위해서는     }
        {   삭제 (Delete API) 호출해야 합니다.                                 }
        {**********************************************************************}

        // 메모
        memo := '(역)발행요청 취소 메모';
        
        try
                response := taxinvoiceService.CancelRequest(txtCorpNum.text, MgtKeyType,
                                                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnRefuseClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 공급자가 요청받은 역)발행 세금계산서를 [거부] 처리합니다.            }
        { - [거부]처리 된 세금계산서의 문서관리번호를 재사용 하기 위해서는     }
        {   삭제 (Delete API) 호출해야 합니다.                                 }
        {**********************************************************************}

        // 메모
        memo := '(역)발행요청 거부 메모';
        
        try
                response := taxinvoiceService.Refuse(txtCorpNum.text, MgtKeyType,
                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnReSendSMSClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
        contents : String;
begin
        {**********************************************************************}
        { 알림문자를 전송합니다. (단문/SMS- 한글 최대 45자)                    }
        { - 알림문자 전송시 포인트가 차감됩니다. (전송실패시 환불처리)         }
        { - 전송내역 확인은 "팝빌 로그인" > [문자 팩스] > [전송내역] 탭에서    }
        {   전송결과를 확인할 수 있습니다.                                     }
        {**********************************************************************}

        // 발신번호, [참고] 발신번호 세칙규정 - http://blog.linkhub.co.kr/3064
        sendNum := '010-1111-2222';

        // 수신번호 
        receiveNum := '010-222-333';

        // 메시지 내용, 최대 90Byte(한글 45자)
        // 길이를 초과한 내용은 삭제되어 전송됩니다.
        contents := '세금계산서가 발행되었습니다 메일을 확인해주세요.';
        
        try
                response := taxinvoiceService.SendSMS(txtCorpNum.text, MgtKeyType,
                                        tbMgtKey.Text, sendNum, receiveNum, contents);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnReSendEmailClick(Sender: TObject);
var
        response : TResponse;
        email : String;
begin
        {**********************************************************************}
        { 발행 안내메일을 재전송합니다.                                        }
        { - 메일내용중 전자세금계산서 [보기] 버튼이 동작하지 않는 경우,        }
        {   키보드 왼쪽 Shift 키를 누르고 버튼을 클릭해보시기 바랍니다         }
        {**********************************************************************}

        email := 'test@test.com';
        
        try
                response := taxinvoiceService.SendEmail(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, email);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnSendInvoiceFaxClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
begin
        {**********************************************************************}
        { 전자세금계산서를 팩스전송합니다.                                     }
        { - 팩스 전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)        }
        { - 전송내역 확인은 "팝빌 로그인" > [문자 팩스] > [팩스] > [전송내역]  }
        {   메뉴에서 전송결과를 확인할 수 있습니다.                            }
        {**********************************************************************}

        // 팩스전송 발신번호
        sendNum := '070-111-222';

        // 수신팩스번호
        receiveNum := '070-1234-1234';
        
        try
                response := taxinvoiceService.SendFAX(txtCorpNum.text, MgtKeyType,
                                         tbMgtKey.Text, sendNum, receiveNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;



procedure TfrmExample.btnGetTaxinvoiceURL1Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 팝빌 > 임시(연동)문서함 팝업 URL을 반환합니다.                       }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, 'TBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL2Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 팝빌 > 매출 문서함 팝업 URL을 반환합니다.                            }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, 'SBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL3Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 팝빌 > 매입 문서함 팝업 URL을 반환합니다.                            }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, 'PBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL4Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 팝빌 > 매출 문서작성 팝업 URL을 반환합니다.                          }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, 'WRITE');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPopUpURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 1건의 전자세금계산서 보기 팝업 URL을 반환합니다.                     }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.getPopupURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPrintURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 1건의 전자세금계산서 인쇄팝업 URL을 반환합니다.                      }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.getPrintURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetMailURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 공급받는자 메일링크 URL을 반환합니다.                                }
        { - 메일링크 URL은 유효시간이 존재하지 않습니다.                       }
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.getMailURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPrintsURLClick(Sender: TObject);
var
        KeyList : Array of String;
        resultURL : String;
begin
        {**********************************************************************}
        { 다수건의 전자세금계산서 인쇄팝업 URL을 반환합니다.                   }
        { - 보안정책으로 인해 반환된 URL의 유효시간은 30초입니다.              }
        {**********************************************************************}

        SetLength(KeyList,4);
        KeyList[0] := '20161004-01';
        KeyList[1] := '20161004-02';
        KeyList[2] := '20161004-03';
        KeyList[3] := '20161004-04';
        
        try
                resultURL := taxinvoiceService.getMassPrintURL(txtCorpNum.text,
                        MgtKeyType, KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);

end;

procedure TfrmExample.btnGetEmailPublicKeyClick(Sender: TObject);
var
        EmailPublicKeyList : TEmailPublicKeyList;
        tmp : string;
        i  :Integer;
begin
        {**********************************************************************}
        { 대용량 연계사업자 메일목록을 반환합니다.                             }
        {**********************************************************************}

        try
                EmailPublicKeyList := taxinvoiceService.GetEmailPublicKeys(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

         tmp := 'confirmNum | email | RegDT' + #13;
        
        for i := 0 to Length(EmailPublicKeyList) -1 do
        begin
            tmp := tmp + EmailPublicKeyList[i].confirmNum + ' | '
                        + EmailPublicKeyList[i].email + ' | '
                        + EmailPublicKeyList[i].regDT + #13;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnRegister_ReverseClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
       
        {**********************************************************************}
        { - 세금계산서 역)발행은 공급자, 공급받는자 모두 팝빌 회원인 경우에만  }
        {   가능합니다.                                                        }
        { - 세금계산서 항목별 정보는 "[전자세금계산서 API 연동매뉴얼] >        }
        {   4.1 (세금)계산서 구성" 을 참조하시기 바랍니다.                     }
        {**********************************************************************}


        // 세금계산서 객체 생성
        taxinvoice := TTaxinvoice.Create;

        // [필수] 작성일자, 표시형식 (yyyyMMdd) ex)20161004
        taxinvoice.writeDate := '20170222';

        // [필수] 발행형태, [정발행, 역발행, 위수탁] 중 기재
        taxinvoice.issueType := '역발행';

        // [필수] [정과금, 역과금] 중 기재, 역발행의 경우 발행시 공급받는자의
        // 포인트가 차감되는 '역과금' 가능
        taxinvoice.chargeDirection := '정과금';

        // [필수] 영수/청구, [영수, 청구] 중 기재
        taxinvoice.purposeType := '영수';

        // [필수] 발행시점, [직접발행, 승인시자동발행] 중 기재
        // 발행예정(Send API) 프로세스를 구현하지 않는경우 '직접발행' 기재
        taxinvoice.issueTiming := '직접발행';         

        // [필수] 과세형태, [과세, 영세, 면세] 중 기재
        taxinvoice.taxType :='과세';


        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // [필수] 공급자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoicerCorpNum := '8888888888';

        // [필수] 공급자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoicerTaxRegID := '';

        // [필수] 공급자 상호
        taxinvoice.invoicerCorpName := '공급자 상호';

        // [필수] 공급자 문서관리번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoicerMgtKey := '';

        // [필수] 공급자 대표자 성명
        taxinvoice.invoicerCEOName := '공급자 대표자 성명';

        // 공급자 주소
        taxinvoice.invoicerAddr := '공급자 주소';

        // 공급자 종목
        taxinvoice.invoicerBizClass := '공급자 업종';

        // 공급자 업태
        taxinvoice.invoicerBizType := '공급자 업태,업태2';

        // 공급자 담당자명
        taxinvoice.invoicerContactName := '공급자 담당자명';

        // 공급자 담당자 메일주소
        taxinvoice.invoicerEmail := 'test@test.com';

        // 공급자 담당자 연락처
        taxinvoice.invoicerTEL := '070-4304-2991';

        // 공급자 담당자 휴대폰 번호
        taxinvoice.invoicerHP := '010-0000-2222';

        // 정발행시 공급받는자에게 발행안내문자 전송여부
        taxinvoice.invoicerSMSSendYN := false;


        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // [필수] 공급받는자 구분, [사업자, 개인, 외국인] 중 기재
        taxinvoice.invoiceeType := '사업자';

        // [필수] 공급받는자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoiceeCorpNum := txtCorpNum.text;

        // [필수] 공급받는자 종사업장 식별번호, 필요시 숫자 4자리 기재        
        taxinvoice.invoiceeTaxRegID := '';

        // [필수] 공급받는자 상호
        taxinvoice.invoiceeCorpName := '공급받는자 상호';

        // [역발행시 필수] 공급받는자 문서관리번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoiceeMgtKey := tbMgtKey.text;

        // [필수] 공급받는자 대표자 성명
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        taxinvoice.invoiceeAddr := '공급받는자 주소';

        // 공급받는자 종목
        taxinvoice.invoiceeBizClass := '공급받는자 업종';

        // 공급받는자 업태
        taxinvoice.invoiceeBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';

        // 공급받는자 메일주소
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // 공급받는자 연락처
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // 공급받는자 휴대폰번호
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // 역발행시 공급자에게 발행안내문자 전송여부
        taxinvoice.invoiceeSMSSendYN := false;

        
        {**********************************************************************}
        {                           세금계산서 정보                            }
        {**********************************************************************}

        // [필수] 공급가액 합계
        taxinvoice.supplyCostTotal := '200000';

        // [필수] 세액 합계
        taxinvoice.taxTotal := '20000';

        // [필수] 합계금액, (공급가액 합계 + 세액합계)
        taxinvoice.totalAmount := '220000';

        // 기재 상 '일련번호' 항목
        taxinvoice.serialNum := '';

        // 기재 상 '권' 항목, 최대값 32767
        taxinvoice.kwon := '1';

        // 기재 상 '호' 항목, 최대값 32767
        taxinvoice.ho := '1';
        
        // 기재 상 '현금' 항목
        taxinvoice.cash := '';

        // 기재 상 '수표' 항목
        taxinvoice.chkBill := '';

        // 기재 상 '어음' 항목
        taxinvoice.note := '';

        // 기재 상 '외상미수금' 항목
        taxinvoice.credit := '';

        // 기재 상 '비고' 항목
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';

        // 사업자등록증 이미지 첨부여부                                                
        taxinvoice.businessLicenseYN := false;

        // 통장사본 이미지 첨부여부 
        taxinvoice.bankBookYN := false;
        

        {**********************************************************************}
        {         수정세금계산서 정보 (수정세금계산서 작성시에만 기재          }
        {   수정세금계산서 관련 정보는 연동매뉴얼 또는 개발가이드 링크 참조    }
        { [참고] 수정세금계산서 작성방법 안내 - http://blog.linkhub.co.kr/650  }
        {**********************************************************************}

        // 수정사유코드, 수정사유별로 1~6중 선택기재 
        taxinvoice.modifyCode := '';

        // 원본세금계산서의 ItemKey, 문서확인 (GetInfo API)의 응답결과(ItemKey 항목) 확인.
        taxinvoice.originalTaxinvoiceKey := '';

        
        {**********************************************************************}
        {                        상세항목(품목) 정보                           }
        {**********************************************************************}

        // 상세항목 0~99개 까지 작성가능.
        // 일련번호 (serialNum) 는ㄴ 1부터 99까지 순차기재.
        // SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //일련번호
        taxinvoice.detailList[0].purchaseDT := '20161004';      //거래일자
        taxinvoice.detailList[0].itemName := '품목명';
        taxinvoice.detailList[0].spec := '규격';
        taxinvoice.detailList[0].qty := '1';                    //수량
        taxinvoice.detailList[0].unitCost := '100000';          //단가
        taxinvoice.detailList[0].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[0].tax := '10000';                //세액
        taxinvoice.detailList[0].remark := '비고';

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //일련번호
        taxinvoice.detailList[1].purchaseDT := '20161004';      //거래일자
        taxinvoice.detailList[1].itemName := '품목명2';
        taxinvoice.detailList[1].spec := '규격';
        taxinvoice.detailList[1].qty := '1';                    //수량
        taxinvoice.detailList[1].unitCost := '100000';          //단가
        taxinvoice.detailList[1].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[1].tax := '10000';                //세액
        taxinvoice.detailList[1].remark := '비고';


        {**********************************************************************}
        {                           추가담당자 정보                            }
        { 세금계산서 발행안내메일을 수신받아야 하는 담당자가 다수인 경우 추가로}
        { 담당자 정보를 기재하여 발행안내메일을 전송받을수 있습니다.           }
        {**********************************************************************}

        // 추가담당자 배열초기화, 최대 5개까지 기재 가능
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // 일련번호, 1부터 순차기재
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';     // 메일주소
        taxinvoice.addContactList[0].contactName := '추가담당자명';     // 담당자명

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].serialNum := 2;    //일련번호, 1부터 순차기재
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';     // 메일주소
        taxinvoice.addContactList[1].contactName := '추가담당자명2';    // 담당자명

        
        try
                response := taxinvoiceService.Register(txtCorpNum.text, taxinvoice);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnUpdateClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { [임시저장] 상태의 세금계산서의 기재항목을 수정합니다.                }
        { - 국세청에 전송이 완료된 세금계산서를 수정 또는 삭제하기 위해서는    }
        {    [수정세금계산서]를 발행해야 합니다.                               }
        { - 세금계산서 항목별 정보는 "[전자세금계산서 API 연동매뉴얼] >        }
        {   4.1 (세금)계산서 구성" 을 참조하시기 바랍니다.                     }
        {**********************************************************************}

        
        // 세금계산서 객체 생성
        taxinvoice := TTaxinvoice.Create;

        // [필수] 작성일자, 표시형식 (yyyyMMdd) ex)20161004
        taxinvoice.writeDate := '20161004';

        // [필수] 발행형태, [정발행, 역발행, 위수탁] 중 기재
        taxinvoice.issueType := '정발행';

        // [필수] [정과금, 역과금] 중 기재, '역과금' 은 역발행 프로세스에서만 이용가능
        // 정과금(공급자 과금), 역과금(공급받는자 과금)
        taxinvoice.chargeDirection := '정과금';

        // [필수] 영수/청구, [영수, 청구] 중 기재
        taxinvoice.purposeType := '영수';

        // [필수] 발행시점, [직접발행, 승인시자동발행] 중 기재
        // 발행예정(Send API) 프로세스를 구현하지 않는경우 '직접발행' 기재
        taxinvoice.issueTiming := '직접발행';         

        // [필수] 과세형태, [과세, 영세, 면세] 중 기재
        taxinvoice.taxType :='과세';


        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // [필수] 공급자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoicerCorpNum := '1234567890';

        // [필수] 공급자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoicerTaxRegID := '';

        // [필수] 공급자 상호
        taxinvoice.invoicerCorpName := '공급자 상호_수정';

        // [필수] 공급자 문서관리번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoicerMgtKey := tbMgtKey.Text;

        // [필수] 공급자 대표자 성명
        taxinvoice.invoicerCEOName := '공급자 대표자 성명_수정';

        // 공급자 주소
        taxinvoice.invoicerAddr := '공급자 주소_수정';

        // 공급자 종목
        taxinvoice.invoicerBizClass := '공급자 업종_수정';

        // 공급자 업태
        taxinvoice.invoicerBizType := '공급자 업태,업태2_수정';

        // 공급자 담당자명
        taxinvoice.invoicerContactName := '공급자 담당자명';

        // 공급자 담당자 메일주소
        taxinvoice.invoicerEmail := 'test@test.com';

        // 공급자 담당자 연락처
        taxinvoice.invoicerTEL := '070-4304-2991';

        // 공급자 담당자 휴대폰 번호
        taxinvoice.invoicerHP := '010-0000-2222';

        // 정발행시 공급받는자에게 발행안내문자 전송여부
        taxinvoice.invoicerSMSSendYN := false;


        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // [필수] 공급받는자 구분, [사업자, 개인, 외국인] 중 기재
        taxinvoice.invoiceeType := '사업자';

        // [필수] 공급받는자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoiceeCorpNum := '8888888888';

        // [필수] 공급받는자 종사업장 식별번호, 필요시 숫자 4자리 기재        
        taxinvoice.invoiceeTaxRegID := '';

        // [필수] 공급받는자 상호
        taxinvoice.invoiceeCorpName := '공급받는자 상호';

        // [역발행시 필수] 공급받는자 문서관리번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoiceeMgtKey := '';

        // [필수] 공급받는자 대표자 성명
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        taxinvoice.invoiceeAddr := '공급받는자 주소';

        // 공급받는자 종목
        taxinvoice.invoiceeBizClass := '공급받는자 업종';

        // 공급받는자 업태
        taxinvoice.invoiceeBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';

        // 공급받는자 메일주소
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // 공급받는자 연락처
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // 공급받는자 휴대폰번호
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // 역발행시 공급자에게 발행안내문자 전송여부
        taxinvoice.invoiceeSMSSendYN := false;

        
        {**********************************************************************}
        {                           세금계산서 정보                            }
        {**********************************************************************}

        // [필수] 공급가액 합계
        taxinvoice.supplyCostTotal := '200000';

        // [필수] 세액 합계
        taxinvoice.taxTotal := '20000';

        // [필수] 합계금액, (공급가액 합계 + 세액합계)
        taxinvoice.totalAmount := '220000';

        // 기재 상 '일련번호' 항목
        taxinvoice.serialNum := '';

        // 기재 상 '권' 항목, 최대값 32767
        taxinvoice.kwon := '1';

        // 기재 상 '호' 항목, 최대값 32767
        taxinvoice.ho := '1';
        
        // 기재 상 '현금' 항목
        taxinvoice.cash := '';

        // 기재 상 '수표' 항목
        taxinvoice.chkBill := '';

        // 기재 상 '어음' 항목
        taxinvoice.note := '';

        // 기재 상 '외상미수금' 항목
        taxinvoice.credit := '';

        // 기재 상 '비고' 항목
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';

        // 사업자등록증 이미지 첨부여부                                                
        taxinvoice.businessLicenseYN := false;

        // 통장사본 이미지 첨부여부 
        taxinvoice.bankBookYN := false;
        

        {**********************************************************************}
        {         수정세금계산서 정보 (수정세금계산서 작성시에만 기재          }
        {   수정세금계산서 관련 정보는 연동매뉴얼 또는 개발가이드 링크 참조    }
        { [참고] 수정세금계산서 작성방법 안내 - http://blog.linkhub.co.kr/650  }
        {**********************************************************************}

        // 수정사유코드, 수정사유별로 1~6중 선택기재 
        taxinvoice.modifyCode := '';

        // 원본세금계산서의 ItemKey, 문서확인 (GetInfo API)의 응답결과(ItemKey 항목) 확인.
        taxinvoice.originalTaxinvoiceKey := '';

        
        {**********************************************************************}
        {                        상세항목(품목) 정보                           }
        {**********************************************************************}

        // 상세항목 0~99개 까지 작성가능.
        // 일련번호 (serialNum) 는ㄴ 1부터 99까지 순차기재.
        // SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //일련번호
        taxinvoice.detailList[0].purchaseDT := '20161004';      //거래일자
        taxinvoice.detailList[0].itemName := '품목명';
        taxinvoice.detailList[0].spec := '규격';
        taxinvoice.detailList[0].qty := '1';                    //수량
        taxinvoice.detailList[0].unitCost := '100000';          //단가
        taxinvoice.detailList[0].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[0].tax := '10000';                //세액
        taxinvoice.detailList[0].remark := '비고';

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //일련번호
        taxinvoice.detailList[1].purchaseDT := '20161004';      //거래일자
        taxinvoice.detailList[1].itemName := '품목명2';
        taxinvoice.detailList[1].spec := '규격';
        taxinvoice.detailList[1].qty := '1';                    //수량
        taxinvoice.detailList[1].unitCost := '100000';          //단가
        taxinvoice.detailList[1].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[1].tax := '10000';                //세액
        taxinvoice.detailList[1].remark := '비고';


        {**********************************************************************}
        {                           추가담당자 정보                            }
        { 세금계산서 발행안내메일을 수신받아야 하는 담당자가 다수인 경우 추가로}
        { 담당자 정보를 기재하여 발행안내메일을 전송받을수 있습니다.           }
        {**********************************************************************}

        // 추가담당자 배열초기화, 최대 5개까지 기재 가능
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // 일련번호, 1부터 순차기재
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';     // 메일주소
        taxinvoice.addContactList[0].contactName := '추가담당자명';     // 담당자명

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].serialNum := 2;    //일련번호, 1부터 순차기재
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';     // 메일주소
        taxinvoice.addContactList[1].contactName := '추가담당자명2';    // 담당자명

        try
                response := taxinvoiceService.Update(txtCorpNum.text, MgtKeyType,
                                        tbMgtKey.Text, taxinvoice,txtUserID.Text);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnUpdate_ReverseClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { [임시저장] 상태의 역)발행 세금계산서의 기재항목을 수정합니다.        }
        { - 세금계산서 수정은 [임시저장]상태에서만 가능합니다.                 }
        { - 세금계산서 항목별 정보는 "[전자세금계산서 API 연동매뉴얼] >        }
        {   4.1 (세금)계산서 구성" 을 참조하시기 바랍니다.                     }
        {**********************************************************************}


        // 세금계산서 객체 생성
        taxinvoice := TTaxinvoice.Create;

        // [필수] 작성일자, 표시형식 (yyyyMMdd) ex)20161004
        taxinvoice.writeDate := '20161004';

        // [필수] 발행형태, [정발행, 역발행, 위수탁] 중 기재
        taxinvoice.issueType := '역발행';

        // [필수] [정과금, 역과금] 중 기재, 역발행의 경우 발행시 공급받는자의
        // 포인트가 차감되는 '역과금' 가능
        taxinvoice.chargeDirection := '정과금';

        // [필수] 영수/청구, [영수, 청구] 중 기재
        taxinvoice.purposeType := '영수';

        // [필수] 발행시점, [직접발행, 승인시자동발행] 중 기재
        // 발행예정(Send API) 프로세스를 구현하지 않는경우 '직접발행' 기재
        taxinvoice.issueTiming := '직접발행';         

        // [필수] 과세형태, [과세, 영세, 면세] 중 기재
        taxinvoice.taxType :='과세';


        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // [필수] 공급자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoicerCorpNum := '8888888888';

        // [필수] 공급자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoicerTaxRegID := '';

        // [필수] 공급자 상호
        taxinvoice.invoicerCorpName := '공급자 상호_수정';

        // [필수] 공급자 문서관리번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoicerMgtKey := '';

        // [필수] 공급자 대표자 성명
        taxinvoice.invoicerCEOName := '공급자 대표자 성명_수정';

        // 공급자 주소
        taxinvoice.invoicerAddr := '공급자 주소_수정';

        // 공급자 종목
        taxinvoice.invoicerBizClass := '공급자 업종_수정';

        // 공급자 업태
        taxinvoice.invoicerBizType := '공급자 업태,업태2_수정';

        // 공급자 담당자명
        taxinvoice.invoicerContactName := '공급자 담당자명_수정';

        // 공급자 담당자 메일주소
        taxinvoice.invoicerEmail := 'test@test.com';

        // 공급자 담당자 연락처
        taxinvoice.invoicerTEL := '070-4304-2991';

        // 공급자 담당자 휴대폰 번호
        taxinvoice.invoicerHP := '010-0000-2222';

        // 정발행시 공급받는자에게 발행안내문자 전송여부
        taxinvoice.invoicerSMSSendYN := false;


        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // [필수] 공급받는자 구분, [사업자, 개인, 외국인] 중 기재
        taxinvoice.invoiceeType := '사업자';

        // [필수] 공급받는자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoiceeCorpNum := '1234567890';

        // [필수] 공급받는자 종사업장 식별번호, 필요시 숫자 4자리 기재        
        taxinvoice.invoiceeTaxRegID := '';

        // [필수] 공급받는자 상호
        taxinvoice.invoiceeCorpName := '공급받는자 상호';

        // [역발행시 필수] 공급받는자 문서관리번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoiceeMgtKey := tbMgtKey.text;

        // [필수] 공급받는자 대표자 성명
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        taxinvoice.invoiceeAddr := '공급받는자 주소';

        // 공급받는자 종목
        taxinvoice.invoiceeBizClass := '공급받는자 업종';

        // 공급받는자 업태
        taxinvoice.invoiceeBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';

        // 공급받는자 메일주소
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // 공급받는자 연락처
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // 공급받는자 휴대폰번호
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // 역발행시 공급자에게 발행안내문자 전송여부
        taxinvoice.invoiceeSMSSendYN := false;

        
        {**********************************************************************}
        {                           세금계산서 정보                            }
        {**********************************************************************}

        // [필수] 공급가액 합계
        taxinvoice.supplyCostTotal := '200000';

        // [필수] 세액 합계
        taxinvoice.taxTotal := '20000';

        // [필수] 합계금액, (공급가액 합계 + 세액합계)
        taxinvoice.totalAmount := '220000';

        // 기재 상 '일련번호' 항목
        taxinvoice.serialNum := '';

        // 기재 상 '권' 항목, 최대값 32767
        taxinvoice.kwon := '1';

        // 기재 상 '호' 항목, 최대값 32767
        taxinvoice.ho := '1';
        
        // 기재 상 '현금' 항목
        taxinvoice.cash := '';

        // 기재 상 '수표' 항목
        taxinvoice.chkBill := '';

        // 기재 상 '어음' 항목
        taxinvoice.note := '';

        // 기재 상 '외상미수금' 항목
        taxinvoice.credit := '';

        // 기재 상 '비고' 항목
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';

        // 사업자등록증 이미지 첨부여부                                                
        taxinvoice.businessLicenseYN := false;

        // 통장사본 이미지 첨부여부 
        taxinvoice.bankBookYN := false;
        

        {**********************************************************************}
        {         수정세금계산서 정보 (수정세금계산서 작성시에만 기재          }
        {   수정세금계산서 관련 정보는 연동매뉴얼 또는 개발가이드 링크 참조    }
        { [참고] 수정세금계산서 작성방법 안내 - http://blog.linkhub.co.kr/650  }
        {**********************************************************************}

        // 수정사유코드, 수정사유별로 1~6중 선택기재 
        taxinvoice.modifyCode := '';

        // 원본세금계산서의 ItemKey, 문서확인 (GetInfo API)의 응답결과(ItemKey 항목) 확인.
        taxinvoice.originalTaxinvoiceKey := '';

        
        {**********************************************************************}
        {                        상세항목(품목) 정보                           }
        {**********************************************************************}

        // 상세항목 0~99개 까지 작성가능.
        // 일련번호 (serialNum) 는ㄴ 1부터 99까지 순차기재.
        // SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //일련번호
        taxinvoice.detailList[0].purchaseDT := '20161004';      //거래일자
        taxinvoice.detailList[0].itemName := '품목명';
        taxinvoice.detailList[0].spec := '규격';
        taxinvoice.detailList[0].qty := '1';                    //수량
        taxinvoice.detailList[0].unitCost := '100000';          //단가
        taxinvoice.detailList[0].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[0].tax := '10000';                //세액
        taxinvoice.detailList[0].remark := '비고';

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //일련번호
        taxinvoice.detailList[1].purchaseDT := '20161004';      //거래일자
        taxinvoice.detailList[1].itemName := '품목명2';
        taxinvoice.detailList[1].spec := '규격';
        taxinvoice.detailList[1].qty := '1';                    //수량
        taxinvoice.detailList[1].unitCost := '100000';          //단가
        taxinvoice.detailList[1].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[1].tax := '10000';                //세액
        taxinvoice.detailList[1].remark := '비고';


        {**********************************************************************}
        {                           추가담당자 정보                            }
        { 세금계산서 발행안내메일을 수신받아야 하는 담당자가 다수인 경우 추가로}
        { 담당자 정보를 기재하여 발행안내메일을 전송받을수 있습니다.           }
        {**********************************************************************}

        // 추가담당자 배열초기화, 최대 5개까지 기재 가능
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // 일련번호, 1부터 순차기재
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';     // 메일주소
        taxinvoice.addContactList[0].contactName := '추가담당자명';     // 담당자명

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].serialNum := 2;    //일련번호, 1부터 순차기재
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';     // 메일주소
        taxinvoice.addContactList[1].contactName := '추가담당자명2';    // 담당자명
        try
                response := taxinvoiceService.Update(txtCorpNum.text,MgtKeyType,tbMgtKey.Text, taxinvoice,txtUserID.Text);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnGetDetailInfoClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        tmp : string;
        i : integer;
begin
        {***********************************************************************}
        { 1건의 세금계산서 상세항목을 확인합니다.                               }
        { - 응답항목에 대한 자세한 사항은 "[전자세금계산서 API 연동매뉴얼]      }
        { > 4.1 (세금)계산서 구성" 을 참조하시기 바랍니다.                      }
        {***********************************************************************}
        
        try
                taxinvoice := taxinvoiceService.getDetailInfo(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := tmp +'writeDate : ' +  taxinvoice.WriteDate + #13;
        tmp := tmp +'chargeDirection : ' +  taxinvoice.ChargeDirection + #13;
        tmp := tmp +'issueType : ' +  taxinvoice.IssueType + #13;
        tmp := tmp +'issueTiming : ' +  taxinvoice.IssueTiming + #13;
        tmp := tmp +'taxType : ' +  taxinvoice.TaxType + #13;

        tmp := tmp +'invoicerCorpNum : ' +  taxinvoice.InvoicerCorpNum + #13;
        tmp := tmp +'invoicerMgtKey : ' +  taxinvoice.InvoicerMgtKey + #13;
        tmp := tmp +'invoicerTaxRegID : ' +  taxinvoice.InvoicerTaxRegID + #13;
        tmp := tmp +'invoicerCorpName : ' +  taxinvoice.InvoicerCorpName + #13;
        tmp := tmp +'invoicerCEOName : ' +  taxinvoice.InvoicerCEOName + #13;
        tmp := tmp +'invoicerAddr : ' +  taxinvoice.InvoicerAddr + #13;
        tmp := tmp +'invoicerBizClass : ' +  taxinvoice.InvoicerBizClass + #13;
        tmp := tmp +'invoicerBizType : ' +  taxinvoice.InvoicerBizType + #13;
        tmp := tmp +'invoicerContactName : ' +  taxinvoice.InvoicerContactName + #13;
        tmp := tmp +'invoicerDeptName : ' +  taxinvoice.InvoicerDeptName + #13;
        tmp := tmp +'invoicerTEL : ' +  taxinvoice.InvoicerTEL + #13;
        tmp := tmp +'invoicerHP : ' +  taxinvoice.InvoicerHP + #13;
        tmp := tmp +'invoicerEmail : ' +  taxinvoice.InvoicerEmail + #13;
        tmp := tmp +'invoicerSMSSendYN : ' +  IfThen(taxinvoice.InvoicerSMSSendYN,'true','false') + #13;

        tmp := tmp +'invoiceeCorpNum : ' +  taxinvoice.InvoiceeCorpNum + #13;
        tmp := tmp +'invoiceeMgtKey : ' +  taxinvoice.InvoiceeMgtKey + #13;
        tmp := tmp +'invoiceeTaxRegID : ' +  taxinvoice.InvoiceeTaxRegID + #13;
        tmp := tmp +'invoiceeCorpName : ' +  taxinvoice.InvoiceeCorpName + #13;
        tmp := tmp +'invoiceeCEOName : ' +  taxinvoice.InvoiceeCEOName + #13;
        tmp := tmp +'invoiceeAddr : ' +  taxinvoice.InvoiceeAddr + #13;
        tmp := tmp +'invoiceeBizClass : ' +  taxinvoice.InvoiceeBizClass + #13;
        tmp := tmp +'invoiceeBizType : ' +  taxinvoice.InvoiceeBizType + #13;
        tmp := tmp +'invoiceeContactName1 : ' +  taxinvoice.InvoiceeContactName1 + #13;
        tmp := tmp +'invoiceeDeptName1 : ' +  taxinvoice.InvoiceeDeptName1 + #13;
        tmp := tmp +'invoiceeTEL1 : ' +  taxinvoice.InvoiceeTEL1 + #13;
        tmp := tmp +'invoiceeHP1 : ' +  taxinvoice.InvoiceeHP1 + #13;
        tmp := tmp +'invoiceeEmail1 : ' +  taxinvoice.InvoiceeEmail1 + #13;
        tmp := tmp +'invoiceeSMSSendYN : ' +  IfThen(taxinvoice.InvoiceeSMSSendYN,'true','false') + #13;
        tmp := tmp +'closeDownState : ' +  IntToStr(taxinvoice.closeDownState) + #13;
        tmp := tmp +'closeDownStateDate : ' +  taxinvoice.closeDownStateDate + #13;


        tmp := tmp +'trusteeCorpNum : ' +  taxinvoice.trusteeCorpNum + #13;
        tmp := tmp +'trusteeMgtKey : ' +  taxinvoice.trusteeMgtKey + #13;
        tmp := tmp +'trusteeTaxRegID : ' +  taxinvoice.trusteeTaxRegID + #13;
        tmp := tmp +'trusteeCorpName : ' +  taxinvoice.trusteeCorpName + #13;
        tmp := tmp +'trusteeCEOName : ' +  taxinvoice.trusteeCEOName + #13;
        tmp := tmp +'trusteeAddr : ' +  taxinvoice.trusteeAddr + #13;
        tmp := tmp +'trusteeBizClass : ' +  taxinvoice.trusteeBizClass + #13;
        tmp := tmp +'trusteeBizType : ' +  taxinvoice.trusteeBizType + #13;
        tmp := tmp +'trusteeContactName : ' +  taxinvoice.trusteeContactName + #13;
        tmp := tmp +'trusteeDeptName : ' +  taxinvoice.trusteeDeptName + #13;
        tmp := tmp +'trusteeTEL : ' +  taxinvoice.trusteeTEL + #13;
        tmp := tmp +'trusteeHP : ' +  taxinvoice.trusteeHP + #13;
        tmp := tmp +'trusteeEmail : ' +  taxinvoice.trusteeEmail + #13;
        tmp := tmp +'trusteeSMSSendYN : ' +  IfThen(taxinvoice.trusteeSMSSendYN,'true','false') + #13;

        tmp := tmp +'taxTotal : ' +  taxinvoice.taxTotal + #13;
        tmp := tmp +'supplyCostTotal : ' +  taxinvoice.supplyCostTotal + #13;
        tmp := tmp +'totalAmount : ' +  taxinvoice.totalAmount + #13;

        tmp := tmp +'modifyCode : ' +  taxinvoice.modifyCode + #13;

        tmp := tmp +'orgNTSConfirmNum : ' +  taxinvoice.orgNTSConfirmNum + #13;
        tmp := tmp +'purposeType : ' +  taxinvoice.purposeType + #13;
        tmp := tmp +'serialNum : ' +  taxinvoice.serialNum + #13;

        tmp := tmp +'cash : ' +  taxinvoice.cash + #13;
        tmp := tmp +'chkBill : ' +  taxinvoice.chkBill + #13;
        tmp := tmp +'credit : ' +  taxinvoice.credit + #13;
        tmp := tmp +'note : ' +  taxinvoice.note + #13;

        tmp := tmp +'remark1 : ' +  taxinvoice.remark1 + #13;
        tmp := tmp +'remark2 : ' +  taxinvoice.remark2 + #13;
        tmp := tmp +'remark3 : ' +  taxinvoice.remark3 + #13;

        tmp := tmp +'kwon : ' +  taxinvoice.kwon + #13;
        tmp := tmp +'ho : ' +  taxinvoice.ho + #13;

        tmp := tmp +'businessLicenseYN : ' +  IfThen(taxinvoice.businessLicenseYN,'true','false') + #13;
        tmp := tmp +'bankBookYN : ' +  IfThen(taxinvoice.bankBookYN,'true','false') + #13;
        tmp := tmp +'faxsendYN : ' +  IfThen(taxinvoice.fAXSendYN,'true','false') + #13;

        tmp := tmp +'faxreceiveNum : ' +  taxinvoice.fAXReceiveNum + #13;
        tmp := tmp +'ntsconfirmNum : ' +  taxinvoice.nTSConfirmNum + #13;
        tmp := tmp +'originalTaxinvoiceKey : ' +  taxinvoice.originalTaxinvoiceKey + #13;

        tmp := tmp + '-----상세항목-----' + #13;
        
        for i:= 0 to Length(taxinvoice.detailList)-1 do
        begin
            tmp := tmp + IntToStr(taxinvoice.detailList[i].serialNum) + ' | ' +
                         taxinvoice.detailList[i].purchaseDT + ' | ' +
                         taxinvoice.detailList[i].itemName + ' | ' +
                         taxinvoice.detailList[i].spec + ' | ' +
                         taxinvoice.detailList[i].qty + ' | ' +
                         taxinvoice.detailList[i].unitCost + ' | ' +
                         taxinvoice.detailList[i].supplyCost + ' | ' +
                         taxinvoice.detailList[i].tax + ' | ' +
                         taxinvoice.detailList[i].remark + #13 ;

        end;

        tmp := tmp + '-----추가담당자-----' + #13;
        for i:= 0 to Length(taxinvoice.AddContactList)-1 do
        begin
            tmp := tmp + IntToStr(taxinvoice.AddContactList[i].serialNum) + ' | ' +
                         taxinvoice.AddContactList[i].email + ' | ' +
                         taxinvoice.AddContactList[i].contactName + #13 ;

        end;
        
        ShowMessage(tmp);
end;

procedure TfrmExample.btnCheckMgtKeyInUseClick(Sender: TObject);
var
        InUse : boolean;
begin
        {***********************************************************************}
        { 세금계산서를 발행하기전 관리번호 중복여부를 확인합니다.               }
        { - 관리번호는 1~24자리 숫자, 영문, '-', '_' 조합으로 구성할수 있습니다.}
        {***********************************************************************}

        try
                InUse := taxinvoiceService.CheckMgtKeyInUse(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if InUse then ShowMessage('사용중') else ShowMessage('미 사용중.');
end;


procedure TfrmExample.btnGetEPrintUrlClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 세금계산서 인쇄(공급받는자) URL을 반환합니다.                        }
        { - URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.       }
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getEPrintURL(txtCorpNum.Text,
                        MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.Button1Click(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 해당 사업자의 파트너 연동회원 가입여부를 확인합니다.                 }
        { - LinkID는 인증정보에 설정되어 있는 링크아이디 입니다. (37번라인)    }
        {**********************************************************************}

        try
                response := taxinvoiceService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);

end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 회원가입(JoinMember API)을 호출하기 전 아이디 중복을 확인합니다.     }
        {**********************************************************************}

        try
                response := taxinvoiceService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;


procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 확인합니다.                                    }
        {**********************************************************************}

        try
                corpInfo := taxinvoiceService.GetCorpInfo(txtCorpNum.text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName (상호): ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName (대표자 성명) : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType (업태) : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass (종목) : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr (주소) : ' + corpInfo.Addr + #13;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 수정합니다.                                    }
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // 대표자명, 최대 30자
        corpInfo.ceoname := '대표자명';

        // 상호, 최대 70자
        corpInfo.corpName := '상호';

        // 업태, 최대 40자
        corpInfo.bizType := '업태';

        // 종목, 최대 40자
        corpInfo.bizClass := '종목';

        // 주소, 최대 300자
        corpInfo.addr := '서울특별시 강남구 영동대로 517';
        
        try
                response := taxinvoiceService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 연동회원의 담당자 목록을 확인합니다.                                 }
        {**********************************************************************}

        try
                InfoList := taxinvoiceService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        tmp := 'id | email | hp | personName | searchAllAllowYN | tel | fax | mgrYN | regDT' + #13;

        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].id + ' | ';
            tmp := tmp + InfoList[i].email + ' | ';
            tmp := tmp + InfoList[i].hp + ' | ';
            tmp := tmp + InfoList[i].personName + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].searchAllAllowYN) + ' | ';
            tmp := tmp + InfoList[i].tel + ' | ';
            tmp := tmp + InfoList[i].fax + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
            tmp := tmp + InfoList[i].regDT + #13;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { 연동회원의 담당자를 신규로 등록합니다.                               }
        {**********************************************************************}

        // [필수] 담당자 아이디 (6자 이상 20자 미만)
        joinInfo.id := 'testkorea0222_01';

        // [필수] 비밀번호 (6자 이상 20자 미만)
        joinInfo.pwd := 'thisispassword';

        // [필수] 담당자명(한글이나 영문 30자 이내)
        joinInfo.personName := '담당자성명';

        // [필수] 연락처
        joinInfo.tel := '070-4304-2991';

        // 휴대폰번호
        joinInfo.hp := '010-1111-2222';

        // 팩스번호
        joinInfo.fax := '02-6442-9700';
        
        // [필수] 이메일
        joinInfo.email := 'test@test.com';

        // 회사조회 권한여부, true-회사조회 / false-개인조회
        joinInfo.searchAllAllowYN := false;

        // 관리자 권한여부
        joinInfo.mgrYN := false;

        try
                response := taxinvoiceService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 담당자 정보를 수정합니다.                                 }
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // 담당자 아이디
        contactInfo.id := 'testkorea';
        
        // 담당자명
        contactInfo.personName := '테스트 담당자';

        // 연락처
        contactInfo.tel := '070-4304-2991';

        // 휴대폰번호
        contactInfo.hp := '010-4324-1111';

        // 이메일 주소
        contactInfo.email := 'test@test.com';
        
        // 팩스번호
        contactInfo.fax := '02-6442-9799';

        // 조회권한, true(회사조회), false(개인조회)
        contactInfo.searchAllAllowYN := true;

        // 관리자권한 설정여부                                
        contactInfo.mgrYN := false;

        try
                response := taxinvoiceService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnRegistIssueClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
        writeSpecification : Boolean;
        forceIssue : Boolean;
        memo : String;
        emailSubject : String;
        dealInvoiceMgtKey : String;
begin

        {**********************************************************************}
        { 1건의 세금계산서를 즉시발행 처리합니다. (권장)                       }
        { - 세금계산서 항목별 정보는 "[전자세금계산서 API 연동매뉴얼] >        }
        {   4.1 (세금)계산서 구성" 을 참조하시기 바랍니다.                     }
        {**********************************************************************}

        // 세금계산서 객체 생성
        taxinvoice := TTaxinvoice.Create;

        // [필수] 작성일자, 표시형식 (yyyyMMdd) ex)20161004
        taxinvoice.writeDate := '20180312';

        // [필수] 발행형태, [정발행, 역발행, 위수탁] 중 기재
        taxinvoice.issueType := '정발행';

        // [필수] [정과금, 역과금] 중 기재, '역과금' 은 역발행 프로세스에서만 이용가능
        // 정과금(공급자 과금), 역과금(공급받는자 과금)
        taxinvoice.chargeDirection := '정과금';

        // [필수] 영수/청구, [영수, 청구] 중 기재
        taxinvoice.purposeType := '영수';

        // [필수] 발행시점, [직접발행, 승인시자동발행] 중 기재
        // 발행예정(Send API) 프로세스를 구현하지 않는경우 '직접발행' 기재
        taxinvoice.issueTiming := '직접발행';         

        // [필수] 과세형태, [과세, 영세, 면세] 중 기재
        taxinvoice.taxType :='과세';


        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // [필수] 공급자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoicerCorpNum := '1234567890';

        // [필수] 공급자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoicerTaxRegID := '';

        // [필수] 공급자 상호
        taxinvoice.invoicerCorpName := '공급자 상호';

        // [필수] 공급자 문서관리번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoicerMgtKey := tbMgtKey.Text;

        // [필수] 공급자 대표자 성명
        taxinvoice.invoicerCEOName := '공급자 대표자 성명';

        // 공급자 주소
        taxinvoice.invoicerAddr := '공급자 주소';

        // 공급자 종목
        taxinvoice.invoicerBizClass := '공급자 업종';

        // 공급자 업태
        taxinvoice.invoicerBizType := '공급자 업태,업태2';

        // 공급자 담당자명
        taxinvoice.invoicerContactName := '공급자 담당자명';

        // 공급자 담당자 메일주소
        taxinvoice.invoicerEmail := 'test@test.com';

        // 공급자 담당자 연락처
        taxinvoice.invoicerTEL := '070-4304-2991';

        // 공급자 담당자 휴대폰 번호
        taxinvoice.invoicerHP := '010-0000-2222';

        // 정발행시 공급받는자에게 발행안내문자 전송여부
        taxinvoice.invoicerSMSSendYN := false;


        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // [필수] 공급받는자 구분, [사업자, 개인, 외국인] 중 기재
        taxinvoice.invoiceeType := '사업자';

        // [필수] 공급받는자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoiceeCorpNum := '8888888888';

        // [필수] 공급받는자 종사업장 식별번호, 필요시 숫자 4자리 기재        
        taxinvoice.invoiceeTaxRegID := '';

        // [필수] 공급받는자 상호
        taxinvoice.invoiceeCorpName := '공급받는자 상호';

        // [역발행시 필수] 공급받는자 문서관리번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoiceeMgtKey := '';

        // [필수] 공급받는자 대표자 성명
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        taxinvoice.invoiceeAddr := '공급받는자 주소';

        // 공급받는자 종목
        taxinvoice.invoiceeBizClass := '공급받는자 업종';

        // 공급받는자 업태
        taxinvoice.invoiceeBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';

        // 공급받는자 메일주소
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // 공급받는자 연락처
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // 공급받는자 휴대폰번호
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // 역발행시 공급자에게 발행안내문자 전송여부
        taxinvoice.invoiceeSMSSendYN := false;

        
        {**********************************************************************}
        {                           세금계산서 정보                            }
        {**********************************************************************}

        // [필수] 공급가액 합계
        taxinvoice.supplyCostTotal := '200000';

        // [필수] 세액 합계
        taxinvoice.taxTotal := '20000';

        // [필수] 합계금액, (공급가액 합계 + 세액합계)
        taxinvoice.totalAmount := '220000';

        // 기재 상 '일련번호' 항목
        taxinvoice.serialNum := '';

        // 기재 상 '권' 항목, 최대값 32767
        taxinvoice.kwon := '1';

        // 기재 상 '호' 항목, 최대값 32767
        taxinvoice.ho := '1';
        
        // 기재 상 '현금' 항목
        taxinvoice.cash := '';

        // 기재 상 '수표' 항목
        taxinvoice.chkBill := '';

        // 기재 상 '어음' 항목
        taxinvoice.note := '';

        // 기재 상 '외상미수금' 항목
        taxinvoice.credit := '';

        // 기재 상 '비고' 항목
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';

        // 사업자등록증 이미지 첨부여부                                                
        taxinvoice.businessLicenseYN := false;

        // 통장사본 이미지 첨부여부 
        taxinvoice.bankBookYN := false;
        

        {**********************************************************************}
        {         수정세금계산서 정보 (수정세금계산서 작성시에만 기재          }
        {   수정세금계산서 관련 정보는 연동매뉴얼 또는 개발가이드 링크 참조    }
        { [참고] 수정세금계산서 작성방법 안내 - http://blog.linkhub.co.kr/650  }
        {**********************************************************************}

        // 수정사유코드, 수정사유별로 1~6중 선택기재 
        taxinvoice.modifyCode := '';

        // 원본세금계산서의 ItemKey, 문서확인 (GetInfo API)의 응답결과(ItemKey 항목) 확인.
        taxinvoice.originalTaxinvoiceKey := '';

        
        {**********************************************************************}
        {                        상세항목(품목) 정보                           }
        {**********************************************************************}

        // 상세항목 0~99개 까지 작성가능.
        // 일련번호 (serialNum) 는ㄴ 1부터 99까지 순차기재.
        // SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //일련번호
        taxinvoice.detailList[0].purchaseDT := '20161004';      //거래일자
        taxinvoice.detailList[0].itemName := copy('일이$삼사오육칠팔구십', 1, 8);
        taxinvoice.detailList[0].spec := '규격';
        taxinvoice.detailList[0].qty := '1';                    //수량
        taxinvoice.detailList[0].unitCost := '100000';          //단가
        taxinvoice.detailList[0].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[0].tax := '10000';                //세액
        taxinvoice.detailList[0].remark := '비고';

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //일련번호
        taxinvoice.detailList[1].purchaseDT := '20161004';      //거래일자
        taxinvoice.detailList[1].itemName := '품목명2';
        taxinvoice.detailList[1].spec := '규격';
        taxinvoice.detailList[1].qty := '1';                    //수량
        taxinvoice.detailList[1].unitCost := '100000';          //단가
        taxinvoice.detailList[1].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[1].tax := '10000';                //세액
        taxinvoice.detailList[1].remark := '비고';


        {**********************************************************************}
        {                           추가담당자 정보                            }
        { 세금계산서 발행안내메일을 수신받아야 하는 담당자가 다수인 경우 추가로}
        { 담당자 정보를 기재하여 발행안내메일을 전송받을수 있습니다.           }
        {**********************************************************************}

        // 추가담당자 배열초기화, 최대 5개까지 기재 가능
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // 일련번호, 1부터 순차기재
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';     // 메일주소
        taxinvoice.addContactList[0].contactName := '추가담당자명';     // 담당자명

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].serialNum := 2;    //일련번호, 1부터 순차기재
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';     // 메일주소
        taxinvoice.addContactList[1].contactName := '추가담당자명2';    // 담당자명


        // 거래명세서 동시작성 여부
        writeSpecification := false;

        // 거래명세서 동시작성시 명세서 문서관리번호, 1~24자리 영문,숫자,'-','_' 조합으로 구성
        dealInvoiceMgtKey := '';

        // 지연발행 강제여부(forceIssue)
        // 발행마감일이 지난 세금계산서를 발행하는 경우, 가산세가 부과될 수 있습니다.
        // 가산세가 부과되더라도 발행을 해야하는 경우에는 forceIssue의 값을
        // true로 선언하여 발행(Issue API)를 호출하시면 됩니다.
        forceIssue := false;

        // 메모
        memo := '즉시발행 메모';

        // 발행 안내메일 제목, 미기재시 기본제목으로 전송
        emailSubject := '';

        try
                response := taxinvoiceService.RegistIssue(txtCorpNum.text, taxinvoice,
                                        writeSpecification, forceIssue, memo, emailSubject,
                                        dealInvoiceMgtKey);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnCancelIssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin

        {**********************************************************************}
        { [발행완료] 상태의 세금계산서를 발행취소 처리합니다.                  }
        { - [발행취소] 세금계산서는 국세청에 전송되지 않습니다.                }
        { - [발행취소] 세금계산서의 문서관리번호를 재사용하기 위해서는 삭제    }
        {   (Delete API) 를 호출하여 삭제 처리를 해야 합니다.                  }
        {**********************************************************************}

        // 메모
        memo := '발행취소 메모';

        try
                response := taxinvoiceService.CancelIssue(txtCorpNum.text, MgtKeyType,
                                                 tbMgtKey.Text, memo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnDelete_RegistIssueClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 1건의 전자세금계산서를 [삭제]합니다. 세금계산서가 삭제된 경우에만    } 
        { 문서관리번호(mgtKey)를 재사용 할 수 있습니다.                        }
        { - 삭제가능한 문서 상태 : [임시저장], [발행취소], [취소], [거부]      }
        {**********************************************************************}
        
        try
                response := taxinvoiceService.Delete(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnGetPopbillURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        {    연동회원 포인트 충전 URL을 반환합니다.                            }
        {    URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.      }
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.getPopbillURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPopbillURL_CERTClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        {    공인인증서 등록  URL을 반환합니다.                                }
        {    URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.      }
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getPopbillURL(txtCorpNum.Text, 'CERT');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnSearchInfoClick(Sender: TObject);
var
        DType : String;
        SDate : String;
        EDate : String;
        State : Array Of String;
        TType : Array Of String;
        TaxType : Array Of String;
        IssueType : Array Of String;
        LateOnly : String;
        TaxRegIDYN : String;
        TaxRegIDType : String;
        TaxRegID : String;
        QString : String;
        Page : Integer;
        PerPage : Integer;
        Order : String;
        InterOPYN : String;
        tmp : String;
        SearchList : TSearchList;
        i : Integer;
begin
        {**********************************************************************}
        { 검색조건을 사용하여 세금계산서 목록을 조회합니다.                    }
        { - 응답항목에 대한 자세한 사항은 "[전자세금계산서 API 연동매뉴얼] >   }
        {   4.2. (세금)계산서 상태정보 구성" 을 참조하시기 바랍니다.           }
        {**********************************************************************}
        

        // [필수] 일자유형 { R : 등록일시, W : 작성일자, I : 발행일시 } 중 기재
        DType := 'W';

        // [필수] 시작일자, 작성형태(yyyyMMdd)
        SDate := '20171101';

        // [필수] 종료일자, 작성형태(yyyyMMdd)
        EDate := '20171231';

        // 전송상태값 배열. 미기재시 전체 상태조회, 문서상태 값 3자리의 배열, 2,3번째자리 와일드카드 사용가능
        // [참고] "[전자세금계산서 API 연동매뉴얼] > 5.1. (세금)계산서 상태코드"
        SetLength(State, 4);
        State[0] := '3**';
        State[1] := '4**';
        State[2] := '5**';
        State[3] := '6**';

        // 문서유형 배열. {N:일반, M:수정} 선택기재, 미기재시 전체조회
        SetLength(TType,2);
        TType[0] := 'N';
        TType[1] := 'M';

        // 과세형태. {T:과세, N:면세, Z:영세} 선택기재, 미기재시 전체조회
        SetLength(TaxType,3);
        TaxType[0] := 'T';
        TaxType[1] := 'Z';
        TaxType[2] := 'N';

        // 발행형태 배열, {N:정발행, R:역발행, T:위수탁) 선택기재
        SetLength(IssueType, 3);
        IssueType[0] := 'N';
        IssueType[1] := 'R';
        IssueType[2] := 'T';

        // 지연발행여부. {공백 : 전체조회, 0 : 정상발행조회, 1 : 지연발행 조회} 선택기재
        LateOnly := '';

        // 종사업장번호 사업자 유형, S-공급자, B-공급받는자, T-수탁자
        TaxRegIDType := 'S';

        // 종사업장 번호, 콤마(,)로 구분하여 구성, ex) 0001,0002
        TaxRegID := '';

        // 종사업장 유무, {공백-전체조회, 0-종사업장번호 없는문서 조회, 1-검색조건에 따라 조회} 선택기재
        TaxRegIDYN := '';

        // 거래처 정보, 거래처 상호 또는 사업자 등록번호 기재, 공백 처리시 전체조회
        QString := '';

        // 페이지번호, 기본값 1
        Page := 1;

        // 페이지당 검색갯수, 기본값 500, 최대 1000
        PerPage := 10;

        // 정렬방향, 'D' : 내림차순 , 'A' : 오름차순
        Order := 'D';

        // 연동문서 여부, 공백-전체조회, '0'-일반문서 조회, '1'-연동문서 조회
        InterOPYN := '';

        try
                SearchList := taxinvoiceService.search(txtCorpNum.text, MgtKeyType, DType, SDate, EDate, State, TType,
                                        TaxType, IssueType, LateOnly, TaxRegIDType, TaxRegID, TaxRegIDYN, QString, Page, PerPage,
                                        Order, InterOPYN, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'code (응답코드) : '+IntToStr(SearchList.code) + #13;
        tmp := tmp + 'total (총 검색결과 건수) : '+ IntToStr(SearchList.total) + #13;
        tmp := tmp + 'perPage (페이지당 검색개수) : '+ IntToStr(SearchList.perPage) + #13;
        tmp := tmp + 'pageNum (페이지 번호) : '+ IntToStr(SearchList.pageNum) + #13;
        tmp := tmp + 'pageCount (페이지 개수) : '+ IntToStr(SearchList.pageCount) + #13;
        tmp := tmp + 'message (응답메시지) : '+ SearchList.message + #13#13;

        tmp := tmp + 'WriteDate | invoicerMgtKey | StateCode | TaxType |  RegDT | lateIssueYN | invoicerCorpNum |  invoicerCorpName | invoiceeCorpNum | invoiceeCorpName | '
                + ' issueType | supplyCostTotal | taxTotal | invoicerPrintYN | invoiceePrintYN | closeDownState | closeDownStateDate | interOPYN '+#13#13;

        for i := 0 to Length(SearchList.list) -1 do
        begin
            tmp := tmp + SearchList.list[i].WriteDate + ' | '
                        + SearchList.list[i].InvoicerMgtKey  + ' | '
                        + IntToStr(SearchList.list[i].StateCode) + ' | '
                        + SearchList.list[i].TaxType + ' | '
                        + SearchList.list[i].RegDT + ' | '
                        + BoolToStr(SearchList.list[i].lateIssueYN) + ' | '
                        + SearchList.list[i].invoicerCorpNum + ' | '
                        + SearchList.list[i].invoicerCorpname + ' | '
                        + SearchList.list[i].invoiceeCorpNum + ' | '
                        + SearchList.list[i].invoiceeCorpname + ' | '
                        + SearchList.list[i].issueType + ' | '
                        + SearchList.list[i].supplyCostTotal + ' | '
                        + SearchList.list[i].taxTotal + ' | '
                        + BoolToStr(SearchList.list[i].InvoicerPrintYN) + ' | '
                        + BoolToStr(SearchList.list[i].InvoiceePrintYN) + ' | '
                        + IntToStr(SearchList.list[i].closeDownState) + ' | '
                        + SearchList.list[i].closeDownStateDate + ' | '                        
                        + BoolToStr(SearchList.list[i].interOPYN) + #13;
        end;

        SearchList.Free;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnAttachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        {**********************************************************************}
        { 팝빌에 등록된 1건의 전자명세서를 세금계산서에 첨부합니다.            }
        {**********************************************************************}
        
        // 첨부할 전자명세서 문서종류코드, 121-거래명세서, 122-청구서 123-견적서, 124-발주서, 125-입금표, 126-영수증
        SubItemCode := 121;

        // 첨부할 전자명세서 문서관리번호
        SubMgtKey := '20151223-01';

        try
                response := taxinvoiceService.AttachStatement(txtCorpNum.text,
                                        MgtKeyType, tbMgtKey.Text, SubItemCode, SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnDetachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        {**********************************************************************}
        { 세금계산서에 첨부된 전자명세서 1건을 첨부해제합니다.                 }
        {**********************************************************************}

        // 첨부해제할 전자명세서 문서종류코드, 121-거래명세서, 122-청구서 123-견적서, 124-발주서, 125-입금표, 126-영수증
        SubItemCode := 121;

        // 첨부해제할 전자명세서 문서관리번호
        SubMgtKey := '20151223-01';
        
        try
                response := taxinvoiceService.DetachStatement(txtCorpNum.text,
                                        MgtKeyType, tbMgtKey.Text, SubItemCode, SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TTaxinvoiceChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 연동회원의 전자세금계산서 API 서비스 과금정보를 확인합니다.          }
        {**********************************************************************}

        try
                chargeInfo := taxinvoiceService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnGetPopbillURL_SEALClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 인감 및 첨부문서 등록  URL을 반환합니다.                             }
        { URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.         }
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.getPopbillURL(txtCorpNum.Text, 'SEAL');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;


procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        {    파트너 포인트충전 팝업 URL을 반환합니다.                          }
        {    URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.      }
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.getPartnerURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnAssignMgtKeyClick(Sender: TObject);
var
        response : TResponse;
        mgtKey, itemKey : String;
        keyType : EnumMgtKeyType;
begin
        {**********************************************************************}
        { 팝빌사이트에서 작성된 세금계산서에 파트너 문서관리번호를 할당합니다. }
        {**********************************************************************}

        // 세금계산서 유형, SELL-매출, BUY-매입, TRUSTEE-위수탁
        keyType := SELL;

        // 세금계산서 아이템키, 문서 목록조회(Search) API의 반환항목중 ItemKey 참조
        itemKey := '018022712201300001';

        // 할당할 문서관리번호, 숫자, 영문 '-', '_' 조합으로 1~24자리까지
        // 사업자번호별 중복없는 고유번호 할당
        mgtKey := '20180312-02';

        try
                response := taxinvoiceService.AssignMgtKey(txtCorpNum.text, MgtKeyType, itemKey, mgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

end.
