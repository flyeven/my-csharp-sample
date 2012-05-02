using System;

namespace DesignPatterns.Strategy.Ducks
{

    /// <summary>
    /// ����ģʽ �е� ������Զ���(ConcreteStrategy)
    /// ����װ��ʵ��ͬ�����ܵĲ�ͬ�㷨�� 
    /// 
    /// </summary>
	public class FlyWithWings : IFlyBehavior
	{
		public FlyWithWings()
		{}

		#region IFlyBehavior Members

		public object Fly()
		{
			return "�ҷ�����";
		}

		#endregion
	}
}
