.assembly extern mscorlib {}
.assembly MathLib
{
  .ver 2:0:1:0
}

.module MathLib.dll

.namespace HangamaHouse
{
  .class public MathClass extends [mscorlib]System.ValueType
  {
    .field private int32 mValue

    .method  specialname public instance int32 get_Value() cil managed
    {
      ldarg.0
      ldfld int32 HangamaHouse.MathClass::mValue
      ret
    }

    .method specialname public instance void set_Value(int32) cil managed
    {
      ldarg.0
      ldarg.1
      stfld int32 HangamaHouse.MathClass::mValue

      ret
    }

    //Define the property, Value
    .property int32 Value()
    {
      .get instance int32 HangamaHouse.MathClass::get_Value()
      .set instance void HangamaHouse.MathClass::set_Value(int32)
    }

    //Define a method to Get Square
    .method public int32 GetSquare() cil managed
    {
      .maxstack 2
      .locals init (int32)
      ldarg.0

      ldfld int32 HangamaHouse.MathClass::mValue
      stloc.0

      ldloc.0
      ldloc.0
      mul

      ret
    }

    .method public specialname rtspecialname instance void .ctor() cil managed
    {
      ldarg.0
      ldc.i4.s	15
      stfld int32 HangamaHouse.MathClass::mValue
      ret
    }
  }
}
