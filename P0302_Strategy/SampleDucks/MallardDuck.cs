using System;

namespace DesignPatterns.Strategy.Ducks
{
	public class MallardDuck : Duck
	{
		public MallardDuck()
		{
            base.SetQuackBehavior(new Quack1());
            base.SetFlyBehavoir(new FlyWithWings());
		}

		public override object Display()
		{
			return "����һֻҰѼ��";
			
		}
	}
}
