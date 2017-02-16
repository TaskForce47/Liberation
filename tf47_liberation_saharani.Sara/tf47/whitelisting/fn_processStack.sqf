/*

	author: TF47  mindbl4ster

	description:
    send stacked information to clients

	parameter:
    nothing

	return
		bool - successflag

	example
		[] call tf47_whitelist_fnc_processStack;

*/
if(isNil "TF47_PERMISSION_STACK_INPROGRESS")then{TF47_PERMISSION_STACK_INPROGRESS = false};
TF47_PERMISSION_STACK_REDO = if TF47_PERMISSION_STACK_INPROGRESS  then{ true }else { false };
if TF47_PERMISSION_STACK_REDO  exitWith { false };
TF47_PERMISSION_STACK_INPROGRESS = true;

private _stackToProcess = +TF47_PERMISSION_SERVER_STACK;

{
  _x params ["_obj", "_permissionID", "_val"];
  tf47_whitelist_serverToClientPermissionFeedback = _val;
  if(_obj != objNull && isPlayer _obj)then{
      (getPlayerUID _obj) publicVariableClient tf47_whitelist_serverToClientPermissionFeedback;
  };
  tf47_whitelist_serverToClientPermissionFeedback = nil;
}forEach _stackToProcess;

{
  private _id = TF47_PERMISSION_SERVER_STACK find _x;
  if(_id != -1)then{ TF47_PERMISSION_SERVER_STACK deleteAt _id; };
}forEach _stackToProcess;

TF47_PERMISSION_STACK_INPROGRESS = false;
if TF47_PERMISSION_STACK_REDO then{ [] spawn tf47_whitelist_fnc_processStack; };

true
