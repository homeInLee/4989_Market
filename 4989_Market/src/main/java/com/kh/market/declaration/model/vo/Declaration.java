package com.kh.market.declaration.model.vo;

public class Declaration {

	private int declarationNo;
	private String declarationTitle;
	private String declarationWriter;
	private String declarationReceiver;
	private String declarationContent;
	private String declarationdate;
	private String declarationState;
	private String declarationDelete;
	private String declarationDeltype;
	private String declarationDivision;
	
	public Declaration() {}

	protected Declaration(int declarationNo, String declarationTitle, String declarationWriter,
			String declarationReceiver, String declarationContent, String declarationdate, String declarationState,
			String declarationDelete, String declarationDeltype, String declarationDivision) {
		super();
		this.declarationNo = declarationNo;
		this.declarationTitle = declarationTitle;
		this.declarationWriter = declarationWriter;
		this.declarationReceiver = declarationReceiver;
		this.declarationContent = declarationContent;
		this.declarationdate = declarationdate;
		this.declarationState = declarationState;
		this.declarationDelete = declarationDelete;
		this.declarationDeltype = declarationDeltype;
		this.declarationDivision = declarationDivision;
	}

	public int getDeclarationNo() {
		return declarationNo;
	}

	public void setDeclarationNo(int declarationNo) {
		this.declarationNo = declarationNo;
	}

	public String getDeclarationTitle() {
		return declarationTitle;
	}

	public void setDeclarationTitle(String declarationTitle) {
		this.declarationTitle = declarationTitle;
	}

	public String getDeclarationWriter() {
		return declarationWriter;
	}

	public void setDeclarationWriter(String declarationWriter) {
		this.declarationWriter = declarationWriter;
	}

	public String getDeclarationReceiver() {
		return declarationReceiver;
	}

	public void setDeclarationReceiver(String declarationReceiver) {
		this.declarationReceiver = declarationReceiver;
	}

	public String getDeclarationContent() {
		return declarationContent;
	}

	public void setDeclarationContent(String declarationContent) {
		this.declarationContent = declarationContent;
	}

	public String getDeclarationdate() {
		return declarationdate;
	}

	public void setDeclarationdate(String declarationdate) {
		this.declarationdate = declarationdate;
	}

	public String getDeclarationState() {
		return declarationState;
	}

	public void setDeclarationState(String declarationState) {
		this.declarationState = declarationState;
	}

	public String getDeclarationDelete() {
		return declarationDelete;
	}

	public void setDeclarationDelete(String declarationDelete) {
		this.declarationDelete = declarationDelete;
	}

	public String getDeclarationDeltype() {
		return declarationDeltype;
	}

	public void setDeclarationDeltype(String declarationDeltype) {
		this.declarationDeltype = declarationDeltype;
	}

	public String getDeclarationDivision() {
		return declarationDivision;
	}

	public void setDeclarationDivision(String declarationDivision) {
		this.declarationDivision = declarationDivision;
	}

	@Override
	public String toString() {
		return "Declaration [declarationNo=" + declarationNo + ", declarationTitle=" + declarationTitle
				+ ", declarationWriter=" + declarationWriter + ", declarationReceiver=" + declarationReceiver
				+ ", declarationContent=" + declarationContent + ", declarationdate=" + declarationdate
				+ ", declarationState=" + declarationState + ", declarationDelete=" + declarationDelete
				+ ", declarationDeltype=" + declarationDeltype + ", declarationDivision=" + declarationDivision + "]";
	}

	
	
}
