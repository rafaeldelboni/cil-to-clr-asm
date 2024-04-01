.assembly extern mscorlib {}
.assembly extern MathLib { .ver 2:0:1:0 }
.assembly TestMath
{
  .ver 1:0:1:0
}

.module TestMath.exe

.namespace HangamaHouse
{
  .class public TestMath extends [mscorlib]System.ValueType
  {
    .method public static void Main() cil managed
    {
      .maxstack 2
      .entrypoint
      .locals init (valuetype [MathLib]HangamaHouse.MathClass mclass) 

      ldloca mclass
      call instance void [MathLib]HangamaHouse.MathClass::.ctor()

      ldstr "Square (With default Constructor) : "
      call void [mscorlib]System.Console::Write(string)

      ldloca mclass
      call instance int32 [MathLib]HangamaHouse.MathClass::GetSquare()
      call void [mscorlib]System.Console::WriteLine(int32)

      call void HangamaHouse.TestMath::UseProperty()

      ldstr "Programme is finished..."
      call void [mscorlib]System.Console::WriteLine(string)
      ret
    }

    .method public static void UseProperty() cil managed
    {
      .maxstack 2
      .locals init (valuetype [MathLib]HangamaHouse.MathClass tclass)

      ldloca tclass
      ldc.i4 25
      call instance void [MathLib]HangamaHouse.MathClass::set_Value(int32)

      ldloca tclass
      call instance int32 [MathLib]HangamaHouse.MathClass::get_Value()
      ldstr "Propert Value Set to : "
      call void [mscorlib]System.Console::Write(string)
      call void [mscorlib]System.Console::WriteLine(int32)

      //Now Finally, Get the Square
      ldstr "Square (After Setting property) : "
      call void [mscorlib]System.Console::Write(string)

      ldloca tclass
      call instance int32 [MathLib]HangamaHouse.MathClass::GetSquare()
      call void [mscorlib]System.Console::WriteLine(int32)
      ret
    }
  }
}
