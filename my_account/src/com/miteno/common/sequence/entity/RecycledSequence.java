package com.miteno.common.sequence.entity;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="seq_recycle")
public class RecycledSequence {
	@EmbeddedId
	private RecycledSequencePk id;

	public RecycledSequencePk getId() {
		return id;
	}

	public void setId(RecycledSequencePk id) {
		this.id = id;
	}
}
