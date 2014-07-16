{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

module Data.Bugs where

import Conduit
import Data.Map
import Data.Text
import Data.Time
import Text.XML.Cursor.Generic
import Control.Comonad

instance Functor Cursor where
    fmap f c = Cursor
        { parent'           = fmap f (parent' c)
        , precedingSibling' = fmap f (precedingSibling' c)
        , followingSibling' = fmap f (followingSibling' c)
        , child             = fmap f child
        , node              = f (node c)
        }

instance Comonad Cursor where
    extract cursor = node cursor

type family Product a    :: *
type family Component a  :: *
type family Version a    :: *
type family Milestone a  :: *
type family Platform a   :: *
type family System a     :: *
type family Status a     :: *
type family Resolution a :: *
type family Severity a   :: *
type family User a       :: *
type family AttachType a :: *

data Bug a = Bug
    { bugNo         :: Int         -- Value within a range
    , bugCreated    :: UTCTime
    , bugModified   :: UTCTime
    , bugTitle      :: Text
    , bugSummary    :: Text
    , bugProduct    :: Product a
    , bugComponent  :: Component a
    , bugVersion    :: Version a
    , bugMilestone  :: Milestone a
    , bugPlatform   :: Platform a
    , bugOS         :: System a
    , bugStatus     :: Status a
    , bugResolution :: Resolution a
    , bugKeywords   :: [Text]
    , bugPriority   :: Int
    , bugSeverity   :: Severity a
    , bugReporter   :: User a
    , bugAssignee   :: User a
    , bugCc         :: [User a]
    , bugComments   :: [BugComment a]
    , bugMeta       :: Map Text Text
    }

data BugComment a = BugComment
    { commentId          :: Int
    , commentCreated     :: UTCTime
    , commentAuthor      :: User a
    , commentText        :: Text
    , commentAttachments :: [BugAttachment a]
    }

data BugAttachment a = BugAttachment
    { attachId        :: Int
    , attachCreated   :: UTCTime
    , attachModified  :: UTCTime
    , attachTitle     :: Text
    , attachFilename  :: FilePath
    , attachType      :: AttachType a
    , attachSize      :: AttachType a
    , attachSubmitter :: User a
    }

-- sourceBugs :: Connection a -> Producer m (Bug a)
-- sourceBugs conn = do
