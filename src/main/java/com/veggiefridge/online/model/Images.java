package com.veggiefridge.online.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="images")
public class Images {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int imageId;
	
	@Column(name="imageUrl")
	private String imageUrl;
	
	@Column(name="imageSection")
	private String imageSection;

	@Column(name="captionText")
	private String captionText;


	public String getCaptionText() {
		return captionText;
	}

	public void setCaptionText(String captionText) {
		this.captionText = captionText;
	}

	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getImageSection() {
		return imageSection;
	}

	public void setImageSection(String imageSection) {
		this.imageSection = imageSection;
	}

	@Override
	public String toString() {
		return "Images [imageId=" + imageId + ", imageUrl=" + imageUrl + ", imageSection=" + imageSection + "]";
	}

}
