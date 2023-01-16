local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Promise = require(ReplicatedStorage.Common.Promise)

local Pathfinding = { }

function Pathfinding.FollowPath(waypoints, character)
	return Promise.new(function(resolve)
		local humanoid = character:FindFirstChild("Humanoid")
		local animator = humanoid:FindFirstChild("Animator")

		local walkAnimation
		local animationTrack
		local idleAnimation

		if character:FindFirstChild("Animate") and animator then
			idleAnimation = character.Animate.idle.Animation1
			animationTrack = animator:LoadAnimation(idleAnimation)
			animationTrack:Stop()

			walkAnimation = character.Animate.walk.WalkAnim
			animationTrack = animator:LoadAnimation(walkAnimation)
			animationTrack:Play()
		end

		for waypoint = 1, #waypoints:GetChildren() do
			humanoid:MoveTo(waypoints[waypoint].Position)
			humanoid.MoveToFinished:Wait()
		end

		if not animationTrack then return end

		animationTrack:Stop()
		animationTrack = animator:LoadAnimation(idleAnimation)
		animationTrack:Play()
		resolve()
	end)
end

return Pathfinding