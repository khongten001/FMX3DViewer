unit u3DBoolMisc;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Math,
  Generics.Collections,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Types3D,
  System.Math.Vectors, FMX.Objects3D, FMX.MaterialSources, FMX.Controls3D;


const
  TOL = 0.00001;   // tolerance value to test equalities

type
 Real3D = Single;

 // UNKNOWN:  vertex status if it is still unknown
 // INSIDE :  vertex status if it is inside a solid
 // OUTSIDE:  vertex status if it is outside a solid








 T3DBoolShape3D = class
 end;

 T3DBoolTuple3d = class
  public
    x, y, z: Single;
    constructor Create; overload;
    constructor Create(xk, yk, zk: Real3D); overload;
    destructor  Destroy; override;
 end;

 T3DBoolPoint3d = class(T3DBoolTuple3d)
  public
    constructor Create; overload;
    constructor Create(xk, yk, zk: Real3D); overload;
    destructor  Destroy; override;
    function distance(p1: T3DBoolPoint3d): Real3D;
    function Clone(): T3DBoolPoint3d;
 end;

 T3DBoolVector3d = class(T3DBoolTuple3d)
  public
    constructor Create; overload;
    constructor Create(xk, yk, zk: Real3D); overload;
    destructor  Destroy; override;
    function  Clone(): T3DBoolVector3d;
    function  Length(): Real3D;
    function  Angle(v1: T3DBoolVector3d): Real3D;
    function  Dot(v1: T3DBoolVector3d): Real3D;
    function  Cross(v1, v2: T3DBoolVector3d): Real3D;
    procedure Normalize();
 end;

 T3DBoolHelper = class
  public
    class var rnd: Real3D;
    class procedure fill<T>(arrT: array of T; val: T);
    class function Random: Real3D;
 end;

implementation

// ------------------------------ T3DBoolTuple3d -------------------------------

constructor T3DBoolTuple3d.Create;
begin
 inherited Create;
 self.x := 0.0;
 self.y := 0.0;
 self.z := 0.0;
end;

constructor T3DBoolTuple3d.Create(xk, yk, zk: Real3D);
begin
 inherited Create;
 self.x := xk;
 self.y := yk;
 self.z := zk;
end;

destructor T3DBoolTuple3d.Destroy();
begin
 inherited Destroy;
end;




begin
 inherited Create;
end;

constructor T3DBoolPoint3d.Create(xk, yk, zk: Real3D);
begin
 inherited Create(xk, yk, zk);
end;

destructor  T3DBoolPoint3d.Destroy;
begin
 inherited Destroy;
end;

function T3DBoolPoint3d.distance(p1: T3DBoolPoint3d): Real3D;
var
 dx, dy, dz: Real3D;
begin
 dx := self.x - p1.x;
 dy := self.y - p1.y;
 dz := self.z - p1.z;
 Result := Sqrt(dx * dx + dy * dy + dz * dz);
end;

function T3DBoolPoint3d.Clone(): T3DBoolPoint3d;
begin

end;

// ------------------------------ T3DBoolVector3d -------------------------------

constructor T3DBoolVector3d.Create;
begin
 inherited Create;
end;


begin
 inherited Create(xk,yk,zk);
end;


begin
 inherited Destroy;
end;


begin
 Result := T3DBoolVector3d.Create(x,y,z);
end;


begin
 Result := Sqrt(self.x * self.x + self.y * self.y + self.z * self.z);
end;


var
 vDot: Real3D;
begin
 vDot := self.dot(v1) / (self.length() * v1.length());
 if (vDot < -1.0) then
   vDot := -1.0;
 if (vDot > 1.0) then
   vDot := 1.0;
 Result := ArcCos(vDot);
end;


begin
 Result := (self.x * v1.x + self.y * v1.y + self.z * v1.z);
end;


var
 x, y: Real3D;
begin
 x := v1.y * v2.z - v1.z * v2.y;
 y := v2.x * v1.z - v2.z * v1.x;
 self.z := v1.x * v2.y - v1.y * v2.x;
 self.x := x;
 self.y := y;
end;


var
 norm: Real3D;
begin
 norm := 1.0 / Sqrt(self.x * self.x + self.y * self.y + self.z * self.z);
 self.x := self.x * norm;
 self.y := self.y * norm;
 self.z := self.z * norm;
end;








   arrT[i] := val;
 end;
end;

class function T3DBoolHelper.Random: Real3D;


end;




