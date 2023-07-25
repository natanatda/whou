package whou.secproject.component;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CertiDTO extends SelectDTO{
	private int num;
}
