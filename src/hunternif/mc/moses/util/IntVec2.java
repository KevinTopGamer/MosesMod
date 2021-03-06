package hunternif.mc.moses.util;


public class IntVec2 {
	public int x;
	public int y;
	
	public IntVec2(int x, int y) {
		this.x = x;
		this.y = y;
	}
	
	@Override
	public String toString() {
		return "(" + x + ", " + y + ")";
	}
	
	public IntVec2 copy() {
		return new IntVec2(x, y);
	}
	
	public double distanceTo(IntVec2 intVec2) {
		double x1 = x;
		double y1 = y;
		double x2 = intVec2.x;
		double y2 = intVec2.y;
		return Math.sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
	}
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof IntVec2))
			return false;
		IntVec2 vec = (IntVec2) obj;
		return vec.x == x && vec.y == y;
	}
	
	@Override
	public int hashCode() {
		return x + y << 16;
	}
	
	public boolean equalsIntVec3(IntVec2 vec) {
		return vec.x == x && vec.y == y;
	}
}
