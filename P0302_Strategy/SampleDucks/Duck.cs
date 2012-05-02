using System;

namespace DesignPatterns.Strategy.Ducks
{
    public abstract class Duck
    {



        protected IFlyBehavior flyBehavior;
        protected IQuackBehavior quackBehavior;


        public object PerformFly()
        {
            return flyBehavior.Fly();
        }

        public object PerformQuack()
        {
            return quackBehavior.Quack();
        }


        public void SetQuackBehavior(IQuackBehavior qck)
        {
            this.quackBehavior = qck;
        }

        public void SetFlyBehavoir(IFlyBehavior fly)
        {
            this.flyBehavior = fly;
        }




        // Identify the aspects of your application that vary and separate them from what stays the same.
        // �ҵ�ϵͳ�б仯�Ĳ��֣����仯�Ĳ���ͬ�����ȶ��Ĳ��ָ�����

        // ����� �� �� ���� �ǿɱ�ġ�
        // ��Ҫ����ʹ�ò�ͬ�Ĳ��Խ��д���


        public string Swim()
        {
            return "���е�Ѽ�Ӷ�������Ӿ��";
        }





        public abstract object Display();     
    }
}
