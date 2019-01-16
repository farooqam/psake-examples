using System;

namespace NetCoreConsoleApp
{
    internal class ConsoleInputPort : IInputPort
    {
        public void ReadLine()
        {
            Console.ReadLine();
        }
    }
}