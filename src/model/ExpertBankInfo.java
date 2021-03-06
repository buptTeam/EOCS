package model;

// Generated 2015-12-11 16:56:25 by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ExpertBankInfo generated by hbm2java
 */
@Entity
@Table(name = "expert_bank_info")
public class ExpertBankInfo implements java.io.Serializable {

	private int userId;
	private String bankName;
	private String duty;
	private String idCardNumber;
	private String payLevel;
	private Double payDays;
	private Double payTotal;
	private Double payTaxRatio;
	private Double payTaxTotal;
	private Double payReal;
	private String bankCardNumber;
	private String PName;
	private String PTelephone;
	private String PIdCardNumber;
	private String PAddress;
	private String PPostCard;

	public ExpertBankInfo() {
	}

	public ExpertBankInfo(int userId) {
		this.userId = userId;
	}

	public ExpertBankInfo(int userId, String bankName, String duty,
			String idCardNumber, String payLevel, Double payDays,
			Double payTotal, Double payTaxRatio, Double payTaxTotal,
			Double payReal, String bankCardNumber, String PName,
			String PTelephone, String PIdCardNumber, String PAddress,
			String PPostCard) {
		this.userId = userId;
		this.bankName = bankName;
		this.duty = duty;
		this.idCardNumber = idCardNumber;
		this.payLevel = payLevel;
		this.payDays = payDays;
		this.payTotal = payTotal;
		this.payTaxRatio = payTaxRatio;
		this.payTaxTotal = payTaxTotal;
		this.payReal = payReal;
		this.bankCardNumber = bankCardNumber;
		this.PName = PName;
		this.PTelephone = PTelephone;
		this.PIdCardNumber = PIdCardNumber;
		this.PAddress = PAddress;
		this.PPostCard = PPostCard;
	}

	@Id
	@Column(name = "user_id", unique = true, nullable = false)
	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Column(name = "bank_name", length = 50)
	public String getBankName() {
		return this.bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	@Column(name = "duty", length = 20)
	public String getDuty() {
		return this.duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	@Column(name = "Id_card_number", length = 50)
	public String getIdCardNumber() {
		return this.idCardNumber;
	}

	public void setIdCardNumber(String idCardNumber) {
		this.idCardNumber = idCardNumber;
	}

	@Column(name = "pay_level", length = 20)
	public String getPayLevel() {
		return this.payLevel;
	}

	public void setPayLevel(String payLevel) {
		this.payLevel = payLevel;
	}

	@Column(name = "pay_days", precision = 22, scale = 0)
	public Double getPayDays() {
		return this.payDays;
	}

	public void setPayDays(Double payDays) {
		this.payDays = payDays;
	}

	@Column(name = "pay_total", precision = 22, scale = 0)
	public Double getPayTotal() {
		return this.payTotal;
	}

	public void setPayTotal(Double payTotal) {
		this.payTotal = payTotal;
	}

	@Column(name = "pay_tax_ratio", precision = 22, scale = 0)
	public Double getPayTaxRatio() {
		return this.payTaxRatio;
	}

	public void setPayTaxRatio(Double payTaxRatio) {
		this.payTaxRatio = payTaxRatio;
	}

	@Column(name = "pay_tax_total", precision = 22, scale = 0)
	public Double getPayTaxTotal() {
		return this.payTaxTotal;
	}

	public void setPayTaxTotal(Double payTaxTotal) {
		this.payTaxTotal = payTaxTotal;
	}

	@Column(name = "pay_real", precision = 22, scale = 0)
	public Double getPayReal() {
		return this.payReal;
	}

	public void setPayReal(Double payReal) {
		this.payReal = payReal;
	}

	@Column(name = "bank_card_number", length = 50)
	public String getBankCardNumber() {
		return this.bankCardNumber;
	}

	public void setBankCardNumber(String bankCardNumber) {
		this.bankCardNumber = bankCardNumber;
	}

	@Column(name = "p_name", length = 50)
	public String getPName() {
		return this.PName;
	}

	public void setPName(String PName) {
		this.PName = PName;
	}

	@Column(name = "p_telephone", length = 50)
	public String getPTelephone() {
		return this.PTelephone;
	}

	public void setPTelephone(String PTelephone) {
		this.PTelephone = PTelephone;
	}

	@Column(name = "p_Id_card_number", length = 50)
	public String getPIdCardNumber() {
		return this.PIdCardNumber;
	}

	public void setPIdCardNumber(String PIdCardNumber) {
		this.PIdCardNumber = PIdCardNumber;
	}

	@Column(name = "p_address", length = 50)
	public String getPAddress() {
		return this.PAddress;
	}

	public void setPAddress(String PAddress) {
		this.PAddress = PAddress;
	}

	@Column(name = "p_post_card", length = 50)
	public String getPPostCard() {
		return this.PPostCard;
	}

	public void setPPostCard(String PPostCard) {
		this.PPostCard = PPostCard;
	}

}
