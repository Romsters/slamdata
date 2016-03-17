module SlamData.FileSystem.Dialog.Permissions.Component.Install where

import Prelude (Unit())

import Data.Either.Nested (Either6())
import Data.Functor.Coproduct as C
import Data.Functor.Coproduct.Nested (Coproduct6())

import Halogen hiding (HTML())
import Halogen.Component.ChildPath (ChildPath(), cpL, cpR, (:>))

import Quasar.Auth.Permission as Qp

import SlamData.Effects (Slam())
import SlamData.Dialog.Share.User.Component as User
import SlamData.Dialog.Share.Code.Component as Code
import SlamData.Dialog.Share.Confirm.Component as Confirm
import SlamData.Dialog.Share.Permissions.Component as Perms
import SlamData.Halogen.Select.Rotary.Component as Rotary
import SlamData.Halogen.Select.Cascade.Component as Cascade

import SlamData.FileSystem.Dialog.Permissions.Component.State
import SlamData.FileSystem.Dialog.Permissions.Component.Query

type RotaryState = Rotary.State (shareType :: ShareType)
type RotaryQuery = Rotary.Query (shareType :: ShareType)
type CascadeState = Cascade.State Qp.Group
type CascadeQuery = Cascade.Query Qp.Group

type ChildState =
  Either6
    User.State
    Perms.State
    Code.State
    Confirm.State
    RotaryState
    CascadeState

type ChildQuery =
  Coproduct6
    User.Query
    Perms.Query
    Code.Query
    Confirm.Query
    RotaryQuery
    CascadeQuery

type ChildSlot =
  Either6
    Unit
    Unit
    Unit
    Unit
    Unit
    Unit

cpUser
  :: ChildPath
       User.State ChildState
       User.Query ChildQuery
       Unit ChildSlot
cpUser = cpL :> cpL :> cpL :> cpL :> cpL

cpPerms
  :: ChildPath
       Perms.State ChildState
       Perms.Query ChildQuery
       Unit ChildSlot
cpPerms = cpL :> cpL :> cpL :> cpL :> cpR

cpCode
  :: ChildPath
       Code.State ChildState
       Code.Query ChildQuery
       Unit ChildSlot
cpCode = cpL :> cpL :> cpL :> cpR

cpConfirm
  :: ChildPath
       Confirm.State ChildState
       Confirm.Query ChildQuery
       Unit ChildSlot
cpConfirm = cpL :> cpL :> cpR

cpRotary
  :: ChildPath
       RotaryState ChildState
       RotaryQuery ChildQuery
       Unit ChildSlot
cpRotary = cpL :> cpR

cpGroup
  :: ChildPath
       CascadeState ChildState
       CascadeQuery ChildQuery
       Unit ChildSlot
cpGroup = cpR

type DSL = ParentDSL State ChildState Query ChildQuery Slam ChildSlot
type HTML = ParentHTML ChildState Query ChildQuery Slam ChildSlot

type StateP = InstalledState State ChildState Query ChildQuery Slam ChildSlot
type QueryP = C.Coproduct Query (ChildF ChildSlot ChildQuery)
